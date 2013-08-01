class Backend::SessionsController < Backend::AdminController
  def new
		render :layout => 'login'
  end

	def create
		employee = Employee.authenticate(params[:name], params[:password])
		if employee
			session[:employee_id] = employee.id
			session[:backend] = true
			session[:name] = employee.name
			session[:role] = employee.role
			redirect_to backend_root_path, :notice => "Logged in!"
		else
			flash.now.alert = "Invalid login"
			render "new"
		end
	end

	def destroy
		session[:employee_id] = nil
		session[:backend] = nil
		session[:name] = nil
		session[:role] = nil
		redirect_to backend_root_path, :notice => "Logged out!"
	end
	
end
