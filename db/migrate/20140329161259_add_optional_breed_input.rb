class AddOptionalBreedInput < ActiveRecord::Migration
  def change
    add_column :owners, :breed, :string
  end
end
