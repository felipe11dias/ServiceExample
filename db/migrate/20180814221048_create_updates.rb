class CreateUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :updates do |t|
      t.references :user, foreign_key: true
      t.timestamp :anamneses_update
      t.timestamp :example_update
      t.timestamps
    end
  end
end
