require "rails_helper"

RSpec.describe Project do
  it "saves a comment desribing status changes" do
    project = create(:project, status: "Old Status")

    expect do
      project.update(status: "New Status")
    end.to change(Comment, :count).by(1)

    expect(Comment.last.user).to eq(nil)
    expect(Comment.last.body).to eq(
      "Status changed from 'Old Status' to 'New Status'"
    )
  end
end
