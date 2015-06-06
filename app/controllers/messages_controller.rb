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
    each_user = Message.all.group(:username).select { |message| message.created_at > (Time.now - 14400) }
    recent_users_group = []
    each_user.map { |message| recent_users_group.push message.username }
    render json: recent_users_group
  end

  def active_chatrooms
    chatrooms = Message.all.group(:chatroom).count.sort_by { |chatroom, count| count }.last(10).reverse
    chatrooms = Hash[chatrooms]
    render json: chatrooms
  end

end
