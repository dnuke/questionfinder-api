class CreateV1Categories < ActiveRecord::Migration[5.0]
  def change
    create_table :v1_categories do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
