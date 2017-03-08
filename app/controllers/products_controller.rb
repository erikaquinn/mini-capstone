class ProductsController < ApplicationController
  def all_boots_method
    @shoes = Product.all
    render "all_boots.html.erb" 
  end
end
