class CreateDishPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :dish_plans do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.string :name, null: false
      t.text :description

      t.timestamps null: false

      t.index [:name, :user_id], unique: true, name: :index_dish_plans_on_name
    end

    create_table :meal_plans_dish_plans do |t|
      t.references :meal_plan, index: false, foreign_key: true, null: false
      t.references :dish_plan, index: true, foreign_key: true, null: false
      t.index [:meal_plan_id, :dish_plan_id], unique: true, name: :index_meal_plans_dish_plans_on_main
    end
  end
end
