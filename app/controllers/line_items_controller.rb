class LineItemsController < ApplicationController
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    @line_item.price = product.price
    
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(store_url) }
        format.js { @current_item = line_item }
        format.xml {render :xml => @line_item, :status => :created, :location => @line_item }
      else
        format.html { render action: 'new' }
        format.xml { render xml: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    line_item = LineItem.find(params[:id])
    line_item.destroy!

    redirect_to store_url, :notice => "#{line_item.product.title} was successfully deleted"
  end
end