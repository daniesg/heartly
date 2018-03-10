class CreateCalorieRestrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :calorie_restrictions do |t|
      t.integer :max_calories
      t.integer :min_calories
      t.references :restrictable, polymorphic: true, index: false

      t.timestamps null: false

      t.index [:restrictable_type, :restrictable_id], unique: true, name: 'index_calorie_restrictions_on_restrictable'
    end
  end
end
