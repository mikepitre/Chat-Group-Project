class MessagesController < ApplicationController

  def index
    render json: Message.all
  end

  def create
    render json: Message.create(username: params.fetch(:username), text: params.fetch(:text), text: params.fetch(:chatroom))
  end

  def leaderboard
    leaders = Message.group(:username).limit(10).count.sort_by {|k, v| v}.reverse
    render json: leaders
  end

end
