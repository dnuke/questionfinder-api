class CreateV1Answers < ActiveRecord::Migration[5.0]
  def change
    create_table :v1_answers do |t|
      t.text :ansdata
      t.text :ref
      t.references :v1_question, foreign_key: true

      t.timestamps
    end
  end
end
