class CreateV1Questions < ActiveRecord::Migration[5.0]
  def change
    create_table :v1_questions do |t|
      t.text :questdata
      t.references :v1_form, foreign_key: true
      t.references :v1_type, foreign_key: true

      t.timestamps
    end
  end
end
