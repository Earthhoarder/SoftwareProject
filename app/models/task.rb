class Task < ApplicationRecord
    validates_presence_of :chore, :name, :time, :description
end
