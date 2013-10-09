class TasksController < ApplicationController

  before_filter :authenticate_user!, :get_project

  def create
  	@task = Task.new(params[:task])
  	@task.project = @project
  	@task.user = current_user

  	if @task.save
  		redirect_to @project, notice: "Task created!"
  	else
  		redirect_to @project, alert: "Task not created!"
  	end
  end

  def destroy
  end

  private

  def get_project
  	@project = Project.find(params[:project_id])
  end
end
