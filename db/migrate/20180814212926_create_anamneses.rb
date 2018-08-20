class CreateAnamneses < ActiveRecord::Migration[5.2]
  def change
    create_table :anamneses do |t|
      t.boolean :boolean_example, default: false
      t.boolean :boolean_exampletwo
      t.integer :integer_example, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
