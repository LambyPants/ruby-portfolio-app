class PortfoliosController < ApplicationController
    
    #GET /portfolios 
    def index
    @portfolio_items = Portfolio.all
    end
    
    #GET /portfolios/new
    def new
        @portfolio_item = Portfolio.new
    end


    #POST /portfolios
    def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully created.' }
      else
        format.html { render :new }
      end
     end
    end
    
    # GET / blogs/:id/edit
    def edit
        @portfolio_item = Portfolio.find(params[:id])
    end
    
      # PATCH/PUT /blogs/:id
  def update
      @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
    if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
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
end
  