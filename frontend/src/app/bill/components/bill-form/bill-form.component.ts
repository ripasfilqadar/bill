import { Component, OnInit, Inject } from '@angular/core';
import { FormBase, IFormControl } from '../../../shared/models/form-base';
import { MatDialogRef, MAT_DIALOG_DATA, MatDialog } from '@angular/material';

const attribute: IFormControl[] = [
  { name: 'name', required: true },
  { name: 'tax_code', required: true },
  { name: 'price', required: true },
]

@Component({
  selector: 'app-bill-form',
  templateUrl: './bill-form.component.html',
  styleUrls: ['./bill-form.component.css']
})

export class BillFormComponent extends FormBase implements OnInit {
  billTypes = [
    { name: 'Food & Beverage', value: 1 },
    { name: 'Tobacco', value: 2 },
    { name: 'Entertainment', value: 3 }
  ]
  constructor(
    public dialogRef: MatDialogRef<BillFormComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any = {},
  ) {
    super(attribute)
  }

  ngOnInit() {
    this.prepareForm()
  }

}
