class Klass < ActiveRecord::Base
     
     attr_accessor(:start_hour, :start_mins)
     
     validates :name, presence: true
     validates :teacher, presence: true
     validates :day, presence: true
     validates :duration, presence: true, numericality: { only_integer: true }
     
     
end