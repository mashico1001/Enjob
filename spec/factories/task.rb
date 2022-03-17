FactoryBot.define do
  factory :task do
    text { Faker::Lorem.characters(number:30) }
    deadline_at { Faker::Time.forward(days: 1, period: :morning) }
    importance { 1 }
  end
  
end