class RemoveDogNameFromOwner < ActiveRecord::Migration
  def up
    remove_column :owners, :dog_name, :string
  end

  def down
    add_column :owners, :dog_name, :string
  end
end
