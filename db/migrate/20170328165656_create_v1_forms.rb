class CreateV1Forms < ActiveRecord::Migration[5.0]
  def change
    create_table :v1_forms do |t|
      t.text :title
      t.text :details
      t.integer :banksize
      t.integer :questions_count
      t.integer :visits_count
      t.integer :reports_count
      t.references :v1_category, foreign_key: true

      t.timestamps
    end
  end
end
