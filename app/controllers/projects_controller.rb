class ProjectsController < ApplicationController
  before_action :require_logged_in

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    Project.find(params[:id]).destroy

    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :status)
  end
end
