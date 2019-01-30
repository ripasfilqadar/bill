class BillsController < ApplicationController
  before_action :find_bill, except: :create
  def index
    bills = Bill.all
    render :json => create_result(bills, 200)
  end

  def create
    @bill = Bill.new(permitted_params)
    begin
      bill.save!
      result = create_result(@bill, 201, 'Bill created Successfully')
    rescue => exception
      result = create_result(@bill, 400, 'Bill create failed')
    end
    render :json => result
  end

  def show
    if @bill
      render :json => create_result(@bill, 200, '')
    else
      render :json => create_result(@bill, 404, 'Bill Not Found')
    end
  end

  def update
    # binding.pry
    result = create_result(@bill, 200, 'Bill updated successfully')
    begin
      unless @bill
        render :json => create_result(@bill, 404, 'Bill Not Found') and return
      end
      @bill.update_attributes(permitted_params)
      @bill.save!
    rescue => exception
      result = create_result(@bill, 400, "Bill updated failed, error: #{exception.message}")
    end
    render :json => result
  end

  def destroy
    begin
      unless @bill
        render :json => create_result(@bill, 404, 'Bill Not Found') and return
      end
      @bill.destroy!
      result = create_result(@bill, 200, 'Bill deleted successfully')
    rescue => exception
      result = create_result(@bill, 400, "Bill deleted failed, error: #{exception.message}")
    end
    render :json => result
  end

  private
  def permitted_params
    params.require(:bill).permit(:name, :tax_code, :price)
  end

  def find_bill
    @bill = Bill.find_by_id params[:id]
  end

  def create_result(data, status_code = 200, msg = "")
    {
      status_code: status_code,
      message: msg,
      data: data || @bill
    }
  end
end
