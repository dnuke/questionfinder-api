class CreateV1Types < ActiveRecord::Migration[5.0]
  def change
    create_table :v1_types do |t|
      t.string :alias

      t.timestamps
    end
  end
end
