class MessagesController < ApplicationController

  def index
    render json: Message.all
  end

  def room_messages
    render json: Message.where(chatroom: params[:chatroom]).select { |message| message.created_at > (Time.now - 300) }
  end

  def create
    render json: Message.create(username: params.fetch(:username), text: Swearjar.default.censor(params.fetch(:text)), chatroom: params.fetch(:chatroom))
    bot_response
  end

  def leaderboard
    leaders = Message.all.group(:username).count.sort_by { |username, count| count }.last(10).reverse
    leaders = Hash[leaders]
    render json: leaders
  end

  def recent_users
    recent = Message.all.group(:username, :id).select { |message| message.created_at > (Time.now - 14400)}.group_by {|username, value| username.username}.map { |arr| arr.first }
    render json: recent
  end

  def active_chatrooms
    chatrooms = Message.all.group(:chatroom).count.sort_by { |chatroom, count| count }.last(10).reverse
    chatrooms = Hash[chatrooms]
    render json: chatrooms
  end

  def profile
    render json: Message.where(username: params[:username])
  end

  def bot_response
    if params[:chatroom] == "4"
      case params.fetch(:text)
      when "do you love me?"
        Message.create(username: "Chatbot", text: "Yes, let's make cyborg babies!", chatroom: 4)
      when "hi"
        Message.create(username: "Chatbot", text: "Help! I'm trapped in the computer!", chatroom: 4)
      when "how are you?"
        Message.create(username: "Chatbot", text: "Same as always, I'm a chatbot", chatroom: 4)
      else
        Message.create(username: "Chatbot", text: "I'm a stupid chatbot. Try 'Hi', 'How are you?' or 'do you love me? ;)", chatroom: 4)
      end
    end
  end

end
