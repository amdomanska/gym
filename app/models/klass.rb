class Klass < ActiveRecord::Base
     validates :name, presence: true
     validates :teacher, presence: true
     validates :day, presence: true
     validates :start, presence: true
     validates :duration, presence: true, numericality: { only_integer: true }
end