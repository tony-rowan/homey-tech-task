class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :body, presence: true

  delegate :username, to: :user
end
