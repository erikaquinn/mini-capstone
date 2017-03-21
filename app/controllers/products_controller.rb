class ProductsController < ApplicationController
  def index
    if params[:discounted] == "true"
      @boots = Product.where("price < ?", 30)
    else
      sort_attribute = params[:sort_by] || "name"
      sort_attribute_order = params[:sort_order] || "asc"
      @boots = Product.all.order(sort_attribute => sort_attribute_order)
      render "index.html.erb" 
    end
  end

  def new
    render "new.html.erb"
  end

  def create
    boot = Product.new(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description]
      )
    boot.save
    flash[:success] = "Boot successfully created!"
    render "create.html.erb"
  end

  def random
    @boot = Product.all.sample
    render "show.html.erb"
  end

  def show
    boot_id = params[:id]
    if params[:id] == "random"
      @boot = Product.all.sample
    else
      @boot = Product.find_by(id: boot_id)
    end
    render "show.html.erb"
  end

  def edit
    boot_id = params[:id]
    @boot = Product.find_by(id: boot_id)
    render "edit.html.erb"
  end  

  def update
    boot_id = params[:id]
    @boot = Product.find_by(id: boot_id)
    @boot.name = params[:name]
    @boot.price = params[:price]
    @boot.image = params[:image]
    @boot.description = params[:description]
    @boot.save
    render "update.html.erb"
  end

  def destroy
    boot_id = params[:id]
    @boot = Product.find_by(id: boot_id)
    @boot.destroy
    flash[:danger] = "Boot successfully destroyed!"
    redirect_to "/boots"
  end

#  def sale_message
#    if price.to_f < 30  
#      return "Discount Item"
#    else 
#      return "Everyday Value!"  
#    end
# end

  def tax
    return price.to_f * 0.09
  end

  def total
#   return price.to_f * 1.09
    return price.to_f + tax   
  end

  def discounted?
    return price.to_f < 30    #true or false statement
  end

  def price_class_name
    if sale_message == "Discount item!"
      return "discount-item"
    else
      return ""
    end
  end

end