class MessagesController < ApplicationController

  def index
    render json: Message.all
  end

  def create
    render json: Message.create(username: params.fetch(:username), text: params.fetch(:text), chatroom: params.fetch(:chatroom))
  end

  def leaderboard
    leaders = Message.all.group(:username).count.sort_by { |username, count| count }.last(10).reverse.to_h
    render json: leaders
  end


end
