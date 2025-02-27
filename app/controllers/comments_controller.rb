class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def create
    @comment = @project.comments.new(comment_params.merge(user: current_user))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to project_url(@project) }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
