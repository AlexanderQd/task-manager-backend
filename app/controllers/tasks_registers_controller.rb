class TasksRegistersController < ApplicationController
  before_action :set_tasks_register, only: [:update, :destroy]

  def create
    register = Tasks::Register.new register_params
    json = if register.valid? and register.save
      {
       status: 200,
       success: true,
       register: register.as_json
      }
    else
      {
       status: 500,
       success: false,
       errors: register.errors.full_messages
      }
    end

    render json: json
  end

  def update
    json = if @register.update register_params
      {
       status: 200,
       success: true,
       register: @register.as_json
      }
    else
      {
       status: 500,
       success: false,
       errors: @register.errors.full_messages
      }
    end

    render json: json
  end

  def destroy
    json = if @register.destroy
      {
       status: 200,
       success: true
      }
    else
      {
       status: 500,
       success: false,
       errors: @register.errors.full_message
      }
    end

    render json: json
  end

  def current_register_of_user
    current = Tasks::Register.find_by(user_id: params[:user_id], ends_at: nil)
    render json: {
     success: true,
     status: 200,
     register: (current.as_json unless current.nil?),
     task: (current.task.as_json unless current.nil?)
    }
  end

  private

  def register_params
    params.require(:register).permit(
     :id,
     :task_id,
     :user_id,
     :ends_at,
     :starts_at
    )
  end

  def set_tasks_register
    @register = Tasks::Register.find(params[:id])
  end
end
