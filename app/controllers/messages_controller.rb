class MessagesController < ApplicationController

  def index
    render json: Message.all
  end

  def room_messages
    render json: Message.where(chatroom: params[:chatroom]).select { |message| message.created_at > (Time.now - 300) }
  end

  def create
    render json: Message.create(username: params.fetch(:username), text: Swearjar.default.censor(params.fetch(:text)), chatroom: params.fetch(:chatroom))
  end

  def leaderboard
    leaders = Message.all.group(:username).count.sort_by { |username, count| count }.last(10).reverse
    leaders = Hash[leaders]
    render json: leaders
  end

  def recent_users
    recent = Message.all.group(:username, :id).select { |message| message.created_at > (Time.now - 14400)}.group_by {|username, value| username.username}
    render json: recent
  end


  def active_chatrooms
    chatrooms = Message.all.group(:chatroom).count.sort_by { |chatroom, count| count }.last(10).reverse
    chatrooms = Hash[chatrooms]
    render json: chatrooms
  end



end
