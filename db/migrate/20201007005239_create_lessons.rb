class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :name,                      null: false
      t.integer :level_id,                 null: false
      t.string :text,                      null: false
      t.integer :price,                    null: false
      t.date :lesson_date,                 null: false
      t.time :bigin_at,                    null: false
      t.time :closed_at,                   null: false
      t.references :user,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
