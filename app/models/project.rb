class Project < ApplicationRecord
  has_many :comments

  validates :name, presence: true
  validates :status, presence: true

  after_update_commit :add_status_change_comment

  private

  def add_status_change_comment
    Comment.create(
      body: "Status changed from '#{status_previously_was}' to '#{status}'",
      project: self,
      user: nil
    )
  end
end
