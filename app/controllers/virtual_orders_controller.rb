class VirtualOrdersController < ApplicationController
  before_action :set_virtual_order, only: [:show, :edit, :update, :destroy]

  # GET /virtual_orders
  # GET /virtual_orders.json
  def index
    @virtual_orders = VirtualOrder.all
  end

  # GET /virtual_orders/1
  # GET /virtual_orders/1.json
  def show
  end

  # GET /virtual_orders/new
  def new
    @virtual_order = VirtualOrder.new
  end

  # GET /virtual_orders/1/edit
  def edit
  end

  # POST /virtual_orders
  # POST /virtual_orders.json
  def create
    @virtual_order = VirtualOrder.new(virtual_order_params)

    respond_to do |format|
      if @virtual_order.save
        format.html { redirect_to @virtual_order, notice: 'Virtual order was successfully created.' }
        format.json { render :show, status: :created, location: @virtual_order }
      else
        format.html { render :new }
        format.json { render json: @virtual_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /virtual_orders/1
  # PATCH/PUT /virtual_orders/1.json
  def update
    respond_to do |format|
      if @virtual_order.update(virtual_order_params)
        format.html { redirect_to @virtual_order, notice: 'Virtual order was successfully updated.' }
        format.json { render :show, status: :ok, location: @virtual_order }
      else
        format.html { render :edit }
        format.json { render json: @virtual_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /virtual_orders/1
  # DELETE /virtual_orders/1.json
  def destroy
    @virtual_order.destroy
    respond_to do |format|
      format.html { redirect_to virtual_orders_url, notice: 'Virtual order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_virtual_order
      @virtual_order = VirtualOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def virtual_order_params
      params.require(:virtual_order).permit(:name, :phone, :address, :product_count, :payment)
    end
end
