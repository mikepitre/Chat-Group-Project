class AddChatroomColumn < ActiveRecord::Migration
  def change
    add_column(:messages, :chatroom, :integer)
  end
end
