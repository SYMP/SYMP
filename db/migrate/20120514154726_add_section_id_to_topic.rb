class AddSectionIdToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :section_id, :integer

  end
end
