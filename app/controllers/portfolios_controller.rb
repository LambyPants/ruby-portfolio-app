class PortfoliosController < ApplicationController
    
    #GET /potfolios 
    def index
    @portfolio_items = Portfolio.all
    end
end
