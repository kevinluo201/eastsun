class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @items = Item.all
    @invoice = Invoice.new
    @form_option = {}
    @form_option[:url] = invoices_url
    @form_option[:method] = :post
  end

  # GET /invoices/1/edit
  def edit
    @items = Item.all
    @form_option = {}
    @form_option[:url] = invoice_url(@invoice)
    @form_option[:method] = :patch
  end

  # POST /invoices
  # POST /invoices.json
  def create
    ActiveRecord::Base.transaction do
      @invoice = Invoice.new invoice_params
      customer = Customer.find_or_create_by(name: params[:customer_name])
      @invoice.customer = customer
      @invoice.save!

      Item.all.each do |item|
        if params["amount_#{item.id}"].to_i > 0
          InvoiceDetail.create!(invoice: @invoice, item: item, price: item.price,
                                amount: params["amount_#{item.id}"].to_i)
        end
      end
    end

    respond_to do |format|
      if @invoice.calculate_total!
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    ActiveRecord::Base.transaction do
      @invoice.update invoice_params
      @invoice.invoice_details.destroy_all
      Item.all.each do |item|
        if params["amount_#{item.id}"].to_i > 0
          InvoiceDetail.create!(invoice: @invoice, item: item, price: item.price,
                                amount: params["amount_#{item.id}"].to_i)
        end
      end
    end
    @invoice.reload
    respond_to do |format|
      if @invoice.calculate_total!
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def details_json
    @invoice = Invoice.find(params[:id])
    details = @invoice.invoice_details
    details.each { |detail| detail[:item_id] = detail.item.id }

    respond_to do |format|
      format.json { render json: @invoice.invoice_details }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.permit(:deliver_address, :contactor, :contact_phone)
    end
end
