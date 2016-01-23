class Pcompany::ExchangesController < PcompanyController
  before_action :set_exchange, only: [:edit, :update, :destroy]

  def multiple_records
    @currencies = CompaniesCurrency.where("company_id = ? and currency_id != ?", current_user.company.id, current_user.company.currency_id )
  end

  def multiple_records_assign
    Exchange.create(params[:currencies].values)
    redirect_to pcompany_exchanges_url, notice: 'Multiplos registros Efetuado com Sucesso!'
  end
  def index
    @exchanges = Exchange.where(company_id: current_user.company.id).order('date desc')
    #ExchangeOperation.crawler_auto
  end

  # GET /exchanges/new
  def new
    @exchange = Exchange.new
  end

  # GET /exchanges/1/edit
  def edit
  end

  # POST /exchanges
  # POST /exchanges.json
  def create
    @exchange = Exchange.new(exchange_params)

    respond_to do |format|
      if @exchange.save
        format.html { redirect_to pcompany_exchanges_url, notice: 'Cotação Cadastrada com Sucesso!' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /exchanges/1
  # PATCH/PUT /exchanges/1.json
  def update
    respond_to do |format|
      if @exchange.update(exchange_params)
        format.html { redirect_to pcompany_exchanges_url, notice: 'Cotação Atualizada com Sucesso!' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /exchanges/1
  # DELETE /exchanges/1.json
  def destroy
    @exchange.destroy
    respond_to do |format|
      format.html { redirect_to pcompany_exchanges_url, notice: 'Exchange was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exchange
      @exchange = Exchange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exchange_params
      params.require(:exchange).permit(:company_id, :currency_id, :date, :buy, :sale, :for)
    end
end
