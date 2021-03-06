class CompaniesController < ApplicationController
	def index
		@companies = Company.all
	end
	
	def show
		@company = Company.find(params[:id])
	end
	
	def new
		@company = Company.new
	end
	
	def edit
		@company = Company.find(params[:id])
	end
	
	def create
		@company = Company.new(params[:company])
		if @company.save
			redirect_to backend_companies_path
			flash[:notice] = "lulz"
		else
			render :action => 'new'
		end
	end
	
	def update
		@company = Company.find(params[:id])
		if @company.update_attributes(params[:company])
			redirect_to backend_companies_path
		else
			render :action => :edit
		end
	end
	
	def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to backend_companies_path
  end
end
