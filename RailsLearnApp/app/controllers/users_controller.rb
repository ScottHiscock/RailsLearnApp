class UsersController < ApplicationController
  def new
		@user = User.new
		@user.build_address
		@user.build_company
	end

	def create
	  params[:user][:activation_key] = Array.new(32){Random.new.rand(36).to_s(36)}.join
		@user = User.new(params[:user])
		#Rails.logger.debug("My object: #{@user.inspect}")
		if @user.save
			redirect_to root_url, :notice => "Signed up!"
		else
			render "new"
		end
	end
	
	# jak zajsitit aby uzivatel si mohl zobrazit pouze svoje id a ne nekoho ciziho ?
	def show
    @product = Product.find(params[:id])
  end
  
end
