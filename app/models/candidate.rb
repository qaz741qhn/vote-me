class Candidate < ApplicationRecord
  validates :name, :party, :politics, uniqueness: { case_sensitive: false }, presence: true
end
