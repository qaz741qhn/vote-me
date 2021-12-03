class Candidate < ApplicationRecord
  validates :name, :party, :politics, uniqueness: { case_sensitive: false }, presence: true
  has_many :vote_logs, dependent: :destroy

  scope :young_people, -> { where('age < 40') }
  scope :older_than, -> (x) { unscope(:where).where("age > #{x}") }
  default_scope { where('age > 0') }
end
