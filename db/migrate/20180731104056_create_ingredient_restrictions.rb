class CreateIngredientRestrictions < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_restrictions do |t|
      t.string :ingredient_name, index: true
      t.references :restrictable, polymorphic: true, index: false

      t.timestamps null: false

      t.index [:restrictable_type, :restrictable_id, :ingredient_name], unique: true, name: 'index_ingredient_restrictions_on_restrictable_and_ingredient'
    end
  end
end
