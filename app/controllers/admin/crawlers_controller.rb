class Admin::CrawlersController < AdminController
  before_action :set_crawler, only: [:edit, :update, :destroy]

  # GET /states
  # GET /states.json
  def index
    @crawlers = Crawler.all
  end

  # GET /states/new
  def new
    @crawler = Crawler.new
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states
  # POST /states.json
  def create
    @crawler = Crawler.new(crawler_params)

    respond_to do |format|
      if @crawler.save
        format.html { redirect_to admin_crawlers_url }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
    respond_to do |format|
      if @crawler.update(crawler_params)
        format.html { redirect_to admin_crawlers_url }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /crawlers/1
  # DELETE /crawlers/1.json
  def destroy
    @crawler.destroy
    respond_to do |format|
      format.html { redirect_to admin_crawlers_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crawler
      @crawler = Crawler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crawler_params
      params.require(:crawler).permit(:name, :content)
    end
end
