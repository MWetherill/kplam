class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)

    if @task.save
      redirect_to @project, notice: "Task was succcessfully created."
    else
      redirect_to @project, notice: "Unable to create task."
    end
  end

  def update
    @task = Task.find(params[:id])
    @project = Project.find(@task.project_id)

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @project, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @project = Project.find(@task.project_id)

    @task.destroy
    flash[:success] = "Task was successfully deleted."
    redirect_to @project
  end

  private
  
  def task_params
    params.require(:task).permit(:completed, :text, :project_id)
  end
end
