class SettingNullFalse < ActiveRecord::Migration
  def change
    change_column_null(:messages, :username, false)
    change_column_null(:messages, :text, false)
  end
end
