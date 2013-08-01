class Backend::EmployeesController < Backend::AdminController
  def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(params[:employee])

		if @employee.save
			redirect_to backend_root_path, :notice => "Signed up!"
		else
			render "new"
		end
	end
end
