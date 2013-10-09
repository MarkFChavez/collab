class MembershipsController < ApplicationController

  before_filter :authenticate_user!
  layout "dashboard"

  def index
  	@members = User.where("id != ?", current_user.id)
  	@project = Project.find(params[:project_id])
  end

  def create
  	@project = Project.find(params[:project_id])
  	@membership = @project.memberships.build(user_id: params[:user_id])

  	if @membership.save
  		redirect_to @project, notice: "Member added to project"
  	else
  		redirect_to @project, notice: "Member was not added to project"
  	end
  end

  def destroy
  end
end
