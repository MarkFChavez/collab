class ProjectsController < ApplicationController

  before_filter :authenticate_user!
  layout "dashboard"

  def index
    @projects = current_user.projects
  end

  def show
    @project = current_user.projects.includes(:tasks).find(params[:id])
    @members = @project.members
    @task = Task.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(params[:project])

    if @project.save
      redirect_to projects_path, notice: "Project created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
