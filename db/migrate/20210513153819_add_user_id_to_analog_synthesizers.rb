class AddUserIdToAnalogSynthesizers < ActiveRecord::Migration[5.2]
  def change
    add_column :analog_synthesizers, :user_id, :integer
  end
end
