class PortfoliosController < ApplicationController
    layout 'portfolio'
    
    #GET /portfolios
    def index
    @portfolio_items = Portfolio.all
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
        @portfolio_item = Portfolio.find(params[:id])
    end

      # PATCH/PUT /portfolio/:id
  def update
      @portfolio_item = Portfolio.find(params[:id])
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
    @portfolio_item = Portfolio.find(params[:id])
  end

  #DELETE /portfolios/:id
  def destroy
    @portfolio_item = Portfolio.find(params[:id])

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
end
