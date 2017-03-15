class ProductsController < ApplicationController
  def index
    @boots = Product.all
    render "index.html.erb" 
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
    render "create.html.erb"
  end

  def show
    boot_id = params[:id]
    @boot = Product.find_by(id: boot_id)
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
    render "destroy.html.erb"
  end
 
end
