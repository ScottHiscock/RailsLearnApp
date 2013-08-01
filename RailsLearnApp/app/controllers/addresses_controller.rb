class AddressesController < ApplicationController
	def index
		@addresses = Address.all
	end
	
	def show
		@address = Address.find(params[:id])
	end
	
	def new
		@address = Address.new
	end
	
	def edit
		@address = Address.find(params[:id])
	end
	
	def create
	  if params[:address][:state] == nil then params[:address][:state] = "Czech Republic" end
		@address = Address.new(params[:address])
		if @address.save
			redirect_to backend_addresses_path
			flash[:notice] = "lulz"
		else
			render :action => 'new'
		end
	end
	
	def update
		@address = Address.find(params[:id])
		if @address.update_attributes(params[:address])
			redirect_to backend_addresses_path
		else
			render :action => :edit
		end
	end
	
	def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to backend_addresses_path
  end
end
