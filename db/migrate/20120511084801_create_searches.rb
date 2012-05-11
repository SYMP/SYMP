class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :user
      t.string :skill
      t.string :city

      t.timestamps
    end
  end
end
