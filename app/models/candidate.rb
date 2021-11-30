class Candidate < ApplicationRecord
  validates :name, :party, :politics, uniqueness: { case_sensitive: false }, presence: true
  has_many :vote_logs, dependent: :destroy
end
