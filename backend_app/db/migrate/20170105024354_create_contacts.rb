class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :uuid
      t.string :email
    end
    add_index :contacts, [:uuid, :email], unique: true
  end
end
