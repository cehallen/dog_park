class RemoveBreedsFromOwner < ActiveRecord::Migration
  def up
    remove_column :owners, :breed, :string
  end

  def down
    add_column :owners, :breed, :string
  end
end
