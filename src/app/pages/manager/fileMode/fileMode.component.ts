import { Component, OnInit, Input, Output, EventEmitter, ViewChild } from '@angular/core';
import { NavigationFlow, NavigationFlowOutNode } from 'src/app/@dataflow/extra';
import { ConnectionService } from '../../connection.service';
import { Subject } from 'rxjs';
import { OperationsListFlow, OperationsListFlowInNode } from 'src/app/@dataflow/rclone';
import { combineLatest, map, filter } from 'rxjs/operators';
import { CombErr } from 'src/app/@dataflow/core';
import { ListViewComponent } from './listView/listView.component';
import { IManipulate, ClipboardService } from '../clipboard/clipboard.service';

@Component({
	selector: 'manager-fileMode',
	template: ` <manager-listView [list$]="list$" (jump)="jump.emit($event)"> </manager-listView> `,
	styles: [],
})
export class FileModeComponent implements OnInit {
	constructor(private connectService: ConnectionService, private clipboard: ClipboardService) {}

	@Input() nav$: NavigationFlow;

	@Output() jump = new EventEmitter<NavigationFlowOutNode>();

	private listTrigger = new Subject<number>();
	list$: OperationsListFlow;

	refresh() {
		this.listTrigger.next(1);
	}

	@ViewChild(ListViewComponent) listView: ListViewComponent;
	manipulate(o: IManipulate) {
		this.listView.manipulate(o);
		this.clipboard.commit();
	}

	ngOnInit() {
		const outer = this;
		this.list$ = new (class extends OperationsListFlow {
			public prerequest$ = outer.listTrigger.pipe(
				combineLatest(outer.nav$.getOutput(), outer.connectService.listCmd$.verify(this.cmd)),
				map(
					([, navNode, cmdNode]): CombErr<OperationsListFlowInNode> => {
						if (navNode[1].length !== 0 || cmdNode[1].length !== 0)
							return [{}, [].concat(navNode[1], cmdNode[1])] as CombErr<any>;
						return [{ ...navNode[0], ...cmdNode[0] }, []];
					}
				),
				filter((x) => x[1].length !== 0 || !!x[0].remote)
			);
		})();
		this.list$.deploy();
		this.listTrigger.next(1);
	}
}
