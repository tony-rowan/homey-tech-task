class Project < ApplicationRecord
  has_many :comments

  validates :name, presence: true
  validates :status, presence: true
end
