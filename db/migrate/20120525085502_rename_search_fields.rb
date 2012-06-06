class RenameSearchFields < ActiveRecord::Migration
  def up
  	rename_column :searches, :user, :name
  end

  def down
  	rename_column :searches, :name, :user
  end
end
