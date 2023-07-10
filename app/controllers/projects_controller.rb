class ProjectsController < ApplicationController
	def index
		@projects = Project.includes(:comments).order(:created_at)
	end

	def update
		project = Project.find_by_id(params[:id])
		raise(StandardError, 'Project not found') unless project

		if project.active?
			project.update(status: "inactive")
			redirect_to root_path
		else
			project.update(status: "active")
			redirect_to root_path
		end
	end
end
