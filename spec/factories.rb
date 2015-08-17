FactoryGirl.define do

  factory :user do
    first_name       'Manuela'
    last_name        'Carmena'
    sequence(:email) { |n| "manuela#{n}@madrid.es" }
    password         'judgmentday'
    confirmed_at     { Time.now }
  end

  factory :debate do
    sequence(:title) {|n| "Debate #{n} title"}
    description      'Debate description'
    terms_of_service '1'
    association :author, factory: :user
  end

  factory :vote do
    association :votable, factory: :debate
    association :voter, factory: :user
    vote_flag true
  end

  factory :comment do
    commentable
    user
    body 'Comment body'
  end

  factory :commentable do
    debate
  end

  factory :ahoy_event, :class => Ahoy::Event do
    id { SecureRandom.uuid }
    time DateTime.now
    sequence(:name) {|n| "Event #{n} type"}
  end

  factory :visit  do
    id { SecureRandom.uuid }
    started_at DateTime.now
  end
end
