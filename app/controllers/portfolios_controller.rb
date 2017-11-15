class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
    layout "portfolio"
    access all: [:show, :index, :angular], user: {except: [:destroy, :new, :update, :edit]}, site_admin: :all

    #GET /portfolios
    def index
    @portfolio_items = Portfolio.by_position
    end

    def angular
      @angular_portfolio_items = Portfolio.angular
    end

    #GET /portfolios/new
    def new
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build }
    end


    #POST /portfolios
    def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully created.' }
      else
        format.html { render :new }
      end
     end
    end

    # GET / portfolio/:id/edit
    def edit
        3.times { @portfolio_item.technologies.build }
    end

      # PATCH/PUT /portfolio/:id
  def update
    respond_to do |format|
    if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated - YOU DID IT.' }
      else
        format.html { render :edit }
    end
    end
  end
  #GET /portfolios/:id
  def show
  end

  #DELETE /portfolios/:id
  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Record successfully removed.' }
    end
  end

  private
  def portfolio_params
  params.require(:portfolio).permit(:title,
                                    :subtitle,
                                    :body,
                                    technologies_attributes: [:name]
                                    )
  end
  def set_portfolio_item
        @portfolio_item = Portfolio.find(params[:id])
  end
end
