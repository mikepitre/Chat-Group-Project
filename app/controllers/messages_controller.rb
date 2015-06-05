class MessagesController < ApplicationController

  def index
    render json: Message.all.select { |message| message.created_at > (Time.now - 300) }
  end

  def create
    render json: Message.create(username: params.fetch(:username), text: params.fetch(:text), chatroom: params.fetch(:chatroom))
  end

  def leaderboard
    leaders = Message.all.group(:username).count.sort_by { |username, count| count }.last(10).reverse
    leaders = Hash[leaders]
    render json: leaders
  end

  def recent_users
    recent_messages = Message.all.select { |message| message.created_at > (Time.now - 14400) }
    render json: recent_messages

  end

end
