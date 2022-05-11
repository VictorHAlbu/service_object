class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]

  def index
    @payments = Payment.all
  end

  def show
  end

  def new
    @payment = Payment.new
  end

  def edit
  end

  def create
    @payment = Payment.new(payment_params)
    respond_to do |format|
      if @payment.save
        result = CreateInvoiceService.new({payment_id: @payment.id}).charge
        if result == "pending"
          format.html { redirect_to @payment, notice: 'Payment was successfully created and Invoice is pending.' }
          format.json { render :show, status: :created, location: @payment }
        else
          format.html { redirect_to @payment, notice: 'Payment was successfully created and Invoice is issued.' }
          format.json { render :show, status: :created, location: @payment }
        end
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit(:amount, :description, :quantity, :service_invoice_id)
    end
end
