import {
  MatCardModule,
  MatInputModule,
  MatButtonModule,
  MatIconModule,
  MatTooltipModule,
  MatDialogModule
} from '@angular/material'

import { NgxDatatableModule } from '@swimlane/ngx-datatable'
import { FlexLayoutModule } from '@angular/flex-layout'
import { ReactiveFormsModule, FormsModule } from '@angular/forms'
import { DataTableModule } from 'primeng/primeng'

export const matButtonImporter = [
	MatCardModule,
  MatButtonModule,
  MatInputModule,
  MatIconModule,
  MatTooltipModule,
  MatDialogModule,
]

export const DataTableImporter = [
  ...matButtonImporter,
  NgxDatatableModule,
  FlexLayoutModule,
  ReactiveFormsModule,
  FormsModule,
  DataTableModule
]
