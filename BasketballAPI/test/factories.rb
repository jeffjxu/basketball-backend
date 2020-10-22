FactoryBot.define do
  factory :user do
    username { "michaeljordan" }
    password { "secret" }
    password_confirmation { "secret" }
    email { "michaeljordan@gmail.com" }
    firstname { "Michael" }
    lastname { "Jordan" }
    dob { 18.years.ago }
    phone { "1234567890" }
  end

  factory :game do
    name { "game1" }
    date { Date.current }
    time { Time.current }
    description { "a basketball game" }
    private { false }
    longitude { 0.0 }
    latitude { 0.0 }
  end

  factory :player do
    status { "going" }
    association :user
    association :game
  end

  factory :favorite do
    association :favoriter_id
    association :favoritee_id
  end
end