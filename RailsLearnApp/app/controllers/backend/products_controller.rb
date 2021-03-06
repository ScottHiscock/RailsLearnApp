class Backend::ProductsController < Backend::AdminController
def index
		@products = Product.all
	end
	
	def show
		@product = Product.find(params[:id])
	end
	
	def new
		@product = Product.new
	end
	
	def edit
		@product = Product.find(params[:id])
	end
	
	def create
		@product = Product.new(params[:product])
		if @product.save
			redirect_to backend_products_path
			flash[:notice] = "Successfully Created"
		else
			render :action => 'new'
		end
	end
	
	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product])
			redirect_to backend_products_path
			flash[:notice] = "Successfully Updated"
		else
			render :action => :edit
		end
	end
	
	def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to backend_products_path
  end
end
