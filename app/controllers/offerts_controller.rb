class OffertsController < ApplicationController
  before_action :set_offert, only: [:show, :edit, :update, :destroy]
  skip_filter :store_location

  layout "page"

  # GET /offerts
  # GET /offerts.json
  def index
    @offerts = Offert.all
  end

  # GET /offerts/1
  # GET /offerts/1.json
  def show
  end

  # GET /offerts/new
  def new
    @offert = Offert.new
  end

  # GET /offerts/1/edit
  def edit
  end

  # POST /offerts
  # POST /offerts.json
  def create
    @offert = Offert.new(offert_params)

    respond_to do |format|
      if @offert.save

        format.html { redirect_to @offert, notice: 'Offert was successfully created.' }
        format.json { render :show, status: :created, location: @offert }
      else
        format.html { render :new }
        format.json { render json: @offert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offerts/1
  # PATCH/PUT /offerts/1.json
  def update
    respond_to do |format|
      if @offert.update(offert_params)
        format.html { redirect_to @offert, notice: 'Offert was successfully updated.' }
        format.json { render :show, status: :ok, location: @offert }
      else
        format.html { render :edit }
        format.json { render json: @offert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offerts/1
  # DELETE /offerts/1.json
  def destroy
    @offert.destroy
    respond_to do |format|
      format.html { redirect_to offerts_url, notice: 'Offert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offert
      @offert = Offert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offert_params
      params.require(:offert).permit(:company_id, :have, :exchange, :status, :user_id, :obs)
    end
end
