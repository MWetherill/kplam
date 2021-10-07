class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  def index
    @projects = Project.all.order(updated_at: :DESC)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    # option 1
    @project = current_user.projects.new(project_params)
    # option 2
    # @project = Project.new(project_params)
    # @project.user = current_user
    # or
    # @project.user_id = current_user.id


    if @project.save
       flash[:success] = "New project created."
       redirect_to @project
    else
      flash.now[:danger] = "Unable to create new project."
      render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project #{@project.title} was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    flash[:success] = "The project #{@project.title} has been deleted."
    redirect_to projects_path
  end
  
end

private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :user_id)
  end