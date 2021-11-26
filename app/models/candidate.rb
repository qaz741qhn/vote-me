class Candidate < ApplicationRecord
  validates :name, :party, :age, :politics, uniqueness: { case_sensitive: false }, presence: true
end
