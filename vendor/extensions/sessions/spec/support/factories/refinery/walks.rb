
FactoryGirl.define do
  factory :walk, :class => Refinery::Walks::Walk do
    sequence(:guide_name) { |n| "refinery#{n}" }
  end
end

