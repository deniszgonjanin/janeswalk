
FactoryGirl.define do
  factory :session, :class => Refinery::Sessions::Session do
    sequence(:status) { |n| "refinery#{n}" }
  end
end

