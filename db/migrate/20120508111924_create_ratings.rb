class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rated_user
      t.integer :rating_user
      t.integer :rating
      t.string :rating_user_comment
      t.string :rated_user_comment

      t.timestamps
    end
  end
end
