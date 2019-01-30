import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BillFormComponent } from './components/bill-form/bill-form.component';
import { BillComponent } from './components/bill/bill.component';
import { FormsModule } from '@angular/forms';
import { RouterModule, Router, Routes } from '@angular/router';
import { DataTableImporter } from '../shared/models/mat-material-importer';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';


const routes: Routes = [{
  path: '',
  component: BillComponent
}]
@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    RouterModule.forRoot(routes),
  ...DataTableImporter,
  ],
  declarations: [BillFormComponent, BillComponent],
  entryComponents: [BillFormComponent]
})
export class BillModule { }
