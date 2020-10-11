class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :name,                      null: false
      t.string :content,                   null: false
      t.string :text,                      null: false
      t.integer :price,                    null: false
      t.date :lesson_date
      t.time :bigin_at
      t.time :closed_at
      t.references :user,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
