class ProjectsController < ApplicationController
  include ApiJson
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    render json: {
     status: 200,
     success: true,
     projects: Project.all.order(id: :asc).as_json(project_index),
     clients: Client.all.as_json,
     users: User.all.as_json
    }
  end

  def show
    json = if @project
      {
       status: 200,
       success: true,
       project: @project.as_json(project_show)
      }
    else
      {
       status: 404,
       success: false,
       errors: ['Project not found.']
      }
    end

    render json: json
  end

  def create
    project = Project.new project_params
    json = if project.valid? and project.save
      {
       status: 200,
       success: true,
       project: project.as_json(project_show)
      }
    else
      {
       status: 500,
       success: false,
       errors: project.errors.full_messages
      }
    end

    render json: json
  end

  def update
    json = if @project.update project_params
      {
       status: 200,
       success: true,
       project: @project.as_json(project_show)
      }
    else
      {
       status: 500,
       success: false,
       errors: @project.errors.full_messages
      }
    end

    render json: json
  end

  def destroy
    json = if @project.update :active, false
      {
       status: 200,
       success: true,
       project: @project.as_json(project_show)
      }
    else
      {
       status: 500,
       success: false,
       errors: @project.errors.full_message
      }
    end

    render json: json
  end

  private

  def project_params
    params.require(:project).permit(
     :id,
     :title,
     :client_id,
     user_ids: []
    )
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
