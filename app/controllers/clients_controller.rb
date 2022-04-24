class ClientsController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    render json: {
     status: 200,
     success: true,
     clients: Client.all.order(id: :asc).as_json
    }
  end

  def show
    json = if @client
      {
       status: 200,
       success: true,
       client: @client.as_json
      }
    else
      {
       status: 404,
       success: false,
       errors: ['Client not found.']
      }
    end

    render json: json
  end

  def create
    client = Client.new client_params
    json = if client.valid? and client.save
      {
       status: 200,
       success: true,
       client: client.as_json
      }
    else
      {
       status: 500,
       success: false,
       errors: client.errors.full_messages
      }
    end

    render json: json
  end

  def update
    json = if @client.update client_params
      {
       status: 200,
       success: true,
       client: @client.as_json
      }
    else
      {
       status: 500,
       success: false,
       errors: @client.errors.full_messages
      }
    end

    render json: json
  end

  def destroy
    json = if @client.update :active, false
      {
       status: 200,
       success: true,
       client: @client.as_json
      }
    else
      {
       status: 500,
       success: false,
       errors: @client.errors.full_message
      }
    end

    render json: json
  end

  private

  def client_params
    params.require(:client).permit(:id, :name)
  end

  def set_client
    @client = Client.find(params[:id])
  end
end
