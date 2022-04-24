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
    @register = Tasks::register.find(params[:id])
  end
end
