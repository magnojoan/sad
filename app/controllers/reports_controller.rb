class ReportsController < ApplicationController

def print
	@order = Order.find(params[:id])
end

end