class AnalogSynthesizer < ActiveRecord::Base
    belongs_to :user
    validates :name, :manufacturer, presence: :true    
end
