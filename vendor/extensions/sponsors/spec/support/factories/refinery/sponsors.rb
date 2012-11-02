
FactoryGirl.define do
  factory :sponsor, :class => Refinery::Sponsors::Sponsor do
    sequence(:img) { |n| "refinery#{n}" }
  end
end

