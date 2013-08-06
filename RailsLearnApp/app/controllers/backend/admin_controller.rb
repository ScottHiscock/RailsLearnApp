class Backend::AdminController < ApplicationController

	layout :layout
	#before_filter :authorize, :except => [:login, :show_login]
	
	helper_method :current_employee	# helper zpristupnuje metodu ve View

	# private
	def current_employee
		@current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
	end

	def authorize
		if session[:backend] != true
			redirect_to backend_login_path
		end
	end
	
	def layout
		if session[:backend] == true
			"admin"
		else
			"login"
		end
	end

	def show_login
		render "login"
	end
	
	def login
		employee = Employee.authenticate(params[:name], params[:password])
		if employee
			session[:employee_id] = employee.id
			session[:backend] = true
			redirect_to backend_root_path, :notice => "Logged in!"
		else
			flash.now.alert = "Invalid email or password"
			render "login"
		end
	end

	def logout
		session[:employee_id] = nil
		session[:backend] = nil
		redirect_to backend_login_path, :notice => "Logged out!"
	end
	
end
