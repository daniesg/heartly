class CreateMealPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :meal_plans do |t|
      t.belongs_to :day_plan, null: false, foreign_key: true, index: true
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
