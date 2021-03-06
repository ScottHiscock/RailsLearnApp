class Backend::CategoriesController < Backend::AdminController
	
	layout :select_layout
	
	private
	def select_layout
	  "application" unless session[:backend]
	end
	
	def index
		@categories = Category.all
	end
	
	def show
		@category = Category.find(params[:id])
		@products = @category.products
	end
	
	def new
		@category = Category.new
	end
	
	def edit
		@category = Category.find(params[:id])
	end
	
	def create
		@category = Category.new(params[:category])
		if @category.save
			redirect_to backend_categories_path
			flash[:notice] = "lulz"
		else
			render :action => 'new'
		end
	end
	
	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category])
			redirect_to backend_categories_path
		else
			render :action => :edit
		end
	end
	
	def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to backend_categories_path
  end
end