import { BrowserModule } from '@angular/platform-browser';
import { NgModule, ErrorHandler, Injectable } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FlexLayoutModule } from '@angular/flex-layout';
import { NgHttpLoaderModule } from 'ng-http-loader';
import { MatIconModule, MatTabsModule } from '@angular/material';
import { BillModule } from './bill/bill.module';
import { BillComponent } from './bill/components/bill/bill.component';

@NgModule({
  declarations: [],
  imports: [
    BrowserModule,
    HttpClientModule,
    NgHttpLoaderModule,
    BrowserAnimationsModule,
    MatIconModule,
    MatTabsModule,
    FormsModule,
    BillModule,
    FlexLayoutModule,
  ],
  providers: [],
  bootstrap: [BillComponent]
})
export class AppModule { }