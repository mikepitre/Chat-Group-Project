class AddNullFalseChatroom < ActiveRecord::Migration
  def change
    change_column_null(:messages, :chatroom, false)
  end
end
