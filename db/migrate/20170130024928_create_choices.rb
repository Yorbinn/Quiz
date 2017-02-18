class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.string :text
      t.integer :correct
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
