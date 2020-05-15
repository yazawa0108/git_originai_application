class ProjectsController < ApplicationController

  def index
  end
  
  def new
  end
  
  def create
    Project.create(projects_params)
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    # binding.pry
    project = Project.find(params[:id])
    project.update(projects_params_update)
  end
  
  def destroy
  project = Project.find(params[:id])
  project.destroy
  end
  
  private
  def projects_params
    params.permit(:project, :detail)
  end
  
  def projects_params_update
    params.require(:project).permit(:project, :detail)
  end

end
