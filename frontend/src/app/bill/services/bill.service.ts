import { Injectable } from '@angular/core';
import { BaseCrudService } from '../../shared/services/base-crud.service';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class BillService extends BaseCrudService {

  constructor(public http: HttpClient) {
    super()
    this.urlApi = 'http://127.0.0.1:5000/bills'
  }
}
