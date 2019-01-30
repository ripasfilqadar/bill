import { MatDialog } from '@angular/material/dialog'
import { IbaseCrudService } from '../services/ibase-crud.service'
import { TemplateRef, ComponentFactory } from '@angular/core';

export class CrudAction {
  datas: any[] = []
  dataTemp: any[] = []
  pagination: false
  limit = 20
  public service: IbaseCrudService
	public dialog: MatDialog

  getData(params: { [key: string]: any} = {}): any {
    if (this.service === undefined) {
      throw new Error(('service not defined'))
    }
		if (!this.pagination) {
			delete params['offset']
			delete params['limit']
		} else {
			params['offset'] = this.datas.length
			params['limit'] = this.limit
		}
		return new Promise((resolve, reject) =>  {
			this.service.getAll(params).subscribe(result => {
				if (this.pagination) {
					this.datas = [...this.datas, ...result]
					this.dataTemp = this.datas
				} else {
					this.datas = result
					this.dataTemp = [...result]
				}
				resolve(result)
			},
			(err) => reject(err))
		})
	}

  createData(result: any): any {
		return new Promise((resolve, reject) =>  {
			if (result != null) {
				this.service.create(result).subscribe(async () => {
					resolve(result)
				},
				(err) => {
					reject(err)
				}
			)}
		})
	}

	editData(data: any, id: string): any {
		return new Promise((resolve, reject) =>  {
			if (data != null) {
				this.service.update(data, id).subscribe(async(result) => {
					resolve(result)
				},
				(err) => {
          reject(err)
          }
				)
			}
		})
	}

	deleteData(id: string): any {
    return new Promise((resolve, reject) => {
      this.service.delete(id).subscribe(async(result) => {
        resolve(result)

      },
      (err) => {
        reject(err)
      }
      )
    })

	}
}
