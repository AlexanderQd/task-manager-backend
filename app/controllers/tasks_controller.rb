class TasksController < ApplicationController
  include ApiJson
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    render json: {
     status: 200,
     success: true,
     tasks: all_tasks.as_json(task_index),
     projects: Project.ransack({ user_ids_in: [@current_user]}).result.as_json
    }
  end

  def show
    json = if @task
      {
       status: 200,
       success: true,
       task: @task.as_json(task_show)
      }
    else
      {
       status: 404,
       success: false,
       errors: ['Task not found.']
      }
    end

    render json: json
  end

  def create
    task = Task.new task_params
    json = if task.valid? and task.save
      {
       status: 200,
       success: true,
       task: task.as_json(task_show)
      }
    else
      {
       status: 500,
       success: false,
       errors: task.errors.full_messages
      }
    end

    render json: json
  end

  def update
    json = if @task.update task_params
      {
       status: 200,
       success: true,
       task: @task.as_json(task_show)
      }
    else
      {
       status: 500,
       success: false,
       errors: @task.errors.full_messages
      }
    end

    render json: json
  end

  def destroy
    json = if @task.update :active, false
      {
       status: 200,
       success: true,
       task: @task.as_json
      }
    else
      {
       status: 500,
       success: false,
       errors: @task.errors.full_message
      }
    end

    render json: json
  end

  private

  def task_params
    params.require(:task).permit(
     :id,
     :name,
     :project_id,
     :finished,
     :ends_at,
     :starts_at,
     :status_cd
    )
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def all_tasks
    Task.ransack(params[:q]).result.order(id: :asc)
  end
end
