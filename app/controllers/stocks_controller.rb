class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.search_for(params[:stock])
      if @stock
        respond_to do |format|
          format.js {render partial: 'pages/result'}
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol"  
          format.js {render partial: 'pages/result'}
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a ticker symbol"  
        format.js {render partial: 'pages/result'}
      end
    end
  end

end

