class CreateDishRestrictions < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_restrictions do |t|
      t.references :meal_plan, index: false
      t.integer :min_dishes
      t.integer :max_dishes

      t.timestamps null: false

      t.index :meal_plan_id, unique: true
    end
  end
end
