class CreateExames < ActiveRecord::Migration[5.2]
  def change
    create_table :exames do |t|
      t.string :tipo
      t.references :anamnese, foreign_key: true
      t.timestamps
    end
  end
end
