class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :username
      t.string :text


      t.timestamps null: false
    end
  end
end
