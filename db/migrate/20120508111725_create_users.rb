class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :name
      t.string :pw_hash
      t.date :birthdate
      t.string :city

      t.timestamps
    end
  end
end
