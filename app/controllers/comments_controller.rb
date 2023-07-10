class CommentsController < ApplicationController
	before_action :set_project

	def create
		@comment = @project.comments.create(comment_params)
		
		respond_to do |format|
      if @comment.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace('comment_form', partial: 'comments/form', locals: { project: @project, comment: Comment.new }) }
        format.html { render partial: 'comments/form', locals: { project: @project, comment: Comment.new }}
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('comment_form', partial: 'comments/form', locals: { project: @project, comment: @comment }) }
        format.html { render partial: 'comments/form', locals: { project: @project, comment: @comment }}
      end
    end
	end

	private

	def set_project
		@project = Project.find_by_id(params[:project_id])
		raise(StandardError, 'Project not found') unless @project
	end

	def comment_params
		params.require(:comment).permit(:body)
	end
end
