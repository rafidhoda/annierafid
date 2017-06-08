class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]

  require 'net/http'
  require 'json'

  # GET /gifts
  # GET /gifts.json
  def index
    @gifts = Gift.all
  end

  # GET /gifts/1
  # GET /gifts/1.json
  def show
    url = 'http://api.fixer.io/latest?base=USD'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    exchange = JSON.parse(response)
    @nok = exchange['rates']['NOK'].to_f
    @rub = exchange['rates']['RUB'].to_f
    @gbp = exchange['rates']['GBP'].to_f

    # Amount in cents
    orig_amount = @gift.amount

    def convert_amount(orig_amount, currency)
      if currency == 'nok'
        ((orig_amount / @nok) * 100).floor
      elsif currency == 'rub'
        ((orig_amount / @rub) * 100).floor
      elsif currency == 'gbp'
        ((orig_amount / @gbp) * 100).floor
      else
        (orig_amount * 100).floor
      end
    end

    @amount = convert_amount(orig_amount, @gift.currency)
  end

  # GET /gifts/new
  def new
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts
  # POST /gifts.json
  def create
    @gift = Gift.new(gift_params)

    respond_to do |format|
      if @gift.save
        format.html { redirect_to @gift, notice: 'Gift was successfully created.' }
        format.json { render :show, status: :created, location: @gift }
      else
        format.html { render :new }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gifts/1
  # PATCH/PUT /gifts/1.json
  def update
    respond_to do |format|
      if @gift.update(gift_params)
        format.html { redirect_to @gift, notice: 'Gift was successfully updated.' }
        format.json { render :show, status: :ok, location: @gift }
      else
        format.html { render :edit }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifts/1
  # DELETE /gifts/1.json
  def destroy
    @gift.destroy
    respond_to do |format|
      format.html { redirect_to gifts_url, notice: 'Gift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift
      @gift = Gift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gift_params
      params.require(:gift).permit(:amount, :currency)
    end
end
