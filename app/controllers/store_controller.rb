class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  #before_action :authenticate_user!
  def index
    @search = Product.search do
      with(:available, true)
      fulltext params[:search]
    end
      @products = @search.results
    #@products = Product.where(available: true).order(:title)
  end
end
