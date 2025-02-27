class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @project = Project.build
  end

  def create
    @project = Project.build(project_params)

    if @project.save
      redirect_to projects_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy

    redirect_to projects_path, status: :see_other
  end

  private

  def project_params
    params.require(:project).permit(:name, :status)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
