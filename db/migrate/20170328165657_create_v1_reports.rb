class CreateV1Reports < ActiveRecord::Migration[5.0]
  def change
    create_table :v1_reports do |t|
      t.string :email
      t.text :debrief
      t.references :v1_form, foreign_key: true

      t.timestamps
    end
  end
end
