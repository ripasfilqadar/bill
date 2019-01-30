import { Component, OnInit } from '@angular/core';
import { DataTableBase } from '../../../shared/models/datatable-base';
import { BillService } from '../../services/bill.service';
import { BillsData, Bill } from '../../models/bill';
import { MatDialog } from '@angular/material';
import { BillFormComponent } from '../bill-form/bill-form.component';
import { isNullOrUndefined } from 'util';

@Component({
  selector: 'app-bill',
  templateUrl: './bill.component.html',
  styleUrls: ['./bill.component.css']
})
export class BillComponent extends DataTableBase implements OnInit {

  datas: Bill[] = []
  billData: BillsData = new BillsData()

  constructor(
    public service: BillService,
    public dialog: MatDialog
  ) {
    super()
    this.columns = [
      { prop: 'name', name: 'Name'},
      { prop: 'tax_code', name: 'Tax Code'},
      { prop: 'type', name: 'Type'},
      { prop: 'refundable', name: 'Refundable'},
      { prop: 'price', name: 'Price'},
      { prop: 'tax', name: 'Tax'},
      { prop: 'amount', name: 'Amount'},
    ]
  }

  ngOnInit() {
    this.getData()
  }

  getData(){
    this.service.getAll().subscribe((resp) =>{
      this.datas = resp.data.bills
      this.billData = resp.data
    })
  }

  showButton(): boolean{
    return this.selected.length > 0
  }

  onAddClick(){
    const dialogRef = this.dialog.open(BillFormComponent, {})
    dialogRef.afterClosed().subscribe((resp) =>{
      if(isNullOrUndefined(resp)) {
        return
      }
      this.service.create(resp).subscribe(() => {
        this.getData()
      })
    })
  }

  onEditClick(){
    const dialogRef = this.dialog.open(BillFormComponent, this.selected[0])
    dialogRef.afterClosed().subscribe((resp) =>{
      if(isNullOrUndefined(resp)) {
        return
      }
      this.service.update(resp, resp.id).subscribe(() => {
        this.getData()
      })
    })
  }

  onDeleteClick(){
    if(window.confirm('Are sure you want to delete this item ?')){
      this.service.delete(this.selected[0].id).subscribe(() =>{
        this.getData()
      })
     }
  }

}
