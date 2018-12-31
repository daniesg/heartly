class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.string :name, null: false
      t.text   :description

      t.timestamps null: false

      t.index [:name, :user_id], unique: true, name: :index_plans_on_name
    end
  end
end
