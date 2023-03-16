FactoryBot.define do
  factory :comment do
    body { "Comment Body" }
    user
    project
  end
end
