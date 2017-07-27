class Kitten < ApplicationRecord
	validates :name, :age, presence: true
end
