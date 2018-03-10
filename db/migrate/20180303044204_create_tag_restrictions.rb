class CreateTagRestrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_restrictions do |t|
      t.string :tag, null: false
      t.references :restrictable, polymorphic: true, index: false

      t.timestamps null: false

      t.index [:restrictable_type, :restrictable_id, :tag], unique: true, name: 'index_tag_restrictions_on_restrictable_and_tag'
      t.index :tag
    end
  end
end
