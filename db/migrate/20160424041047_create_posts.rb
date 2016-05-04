class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :plan
      t.text :research
      t.text :act
      t.text :observe_thing
      t.text :evaluate
      t.text :reflect
      t.boolean :is_private

      t.timestamps null: false
    end
  end
end
