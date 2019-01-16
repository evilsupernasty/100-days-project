class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new

    redirect_to :new_user_session, notice: "You must be logged in to create a project." unless user_signed_in?
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    if @project.save
        redirect_to @project, notice: "Successfully created project #{@project.title}"
    end
  end

  def show
    find_project
  end

  def edit
    find_project

    redirect_to :new_user_session, notice: "You must be logged in to edit a project." and return unless user_signed_in?
    redirect_to :new_project, notice: "You don't have permission to edit that project. Try creating a new project instead." unless current_user.id == @project.user_id
  end

  def update
    find_project

    if @project.update(project_params)
      redirect_to @project, notice: "Successfully updated project"
    end
  end

  def destroy
    find_project

    @project.destroy

    redirect_to :projects, notice: "Successfully canceled project"
  end

  private

  def project_params
    params.require(:project).permit(:title, :summary, :start_date)
  end

  def find_project
    # TODO: handle when the project with :id does not exist
    @project = Project.find(params[:id])
  end
end
