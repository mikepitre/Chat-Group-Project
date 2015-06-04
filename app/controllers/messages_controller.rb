class MessagesController < ApplicationController

  def index
    render json: Message.all
  end

  def create
    render json: Message.create(username: params.fetch(:username), text: params.fetch(:text))
  end

  def

end
