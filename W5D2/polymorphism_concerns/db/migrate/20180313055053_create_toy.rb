class CreateToy < ActiveRecord::Migration[5.1]
  def change
    create_table :toys do |t|
      t.string :name, null: false, unique: true
      t.integer :toyable_id
      t.string :toyable_type
      t.references :toyable, polymorphic: true, index: true
    end

    add_index :toys, [:name, :toyable_id, :toyable_type], unique: true
  end
end
