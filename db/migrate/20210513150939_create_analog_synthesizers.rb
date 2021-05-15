class CreateAnalogSynthesizers < ActiveRecord::Migration[5.2]
  def change
    create_table :analog_synthesizers do |t|
      t.string :name
      t.string :description
      t.string :manufacturer
      t.integer :date_release
      t.string :image
      t.timestamps null: false
    end
  end
end
