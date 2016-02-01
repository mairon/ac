class Admin::StandardExchangesController < AdminController
  before_action :set_standard_exchange, only: [:show, :edit, :update, :destroy]

  # GET /standard_exchanges
  # GET /standard_exchanges.json
  def index
    @standard_exchanges = StandardExchange.all
  end

  # GET /standard_exchanges/1
  # GET /standard_exchanges/1.json
  def show
  end

  # GET /standard_exchanges/new
  def new
    @standard_exchange = StandardExchange.new
  end

  # GET /standard_exchanges/1/edit
  def edit
  end

  # POST /standard_exchanges
  # POST /standard_exchanges.json
  def create
    @standard_exchange = StandardExchange.new(standard_exchange_params)

    respond_to do |format|
      if @standard_exchange.save
        format.html { redirect_to admin_standard_exchanges_url}
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /standard_exchanges/1
  # PATCH/PUT /standard_exchanges/1.json
  def update
    respond_to do |format|
      if @standard_exchange.update(standard_exchange_params)
        format.html { redirect_to admin_standard_exchanges_url}
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /standard_exchanges/1
  # DELETE /standard_exchanges/1.json
  def destroy
    @standard_exchange.destroy
    respond_to do |format|
      format.html { redirect_to admin_standard_exchanges_url}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard_exchange
      @standard_exchange = StandardExchange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standard_exchange_params
      params.require(:standard_exchange).permit(:currency_want, :currency_have, :operation, :def_format)
    end
end
