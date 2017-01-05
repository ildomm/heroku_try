class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :uuid
      t.string :url
      t.datetime :client_created_at
      t.datetime :server_created_at
    end
    add_index :events, :uuid
  end
end
