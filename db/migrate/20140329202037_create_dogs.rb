class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.string :breed
      t.integer :owner_id, :null_false

      t.timestamps
    end

    Dog.reset_column_information
    add_index :dogs, :owner_id
  end
end

