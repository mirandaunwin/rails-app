FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password { "test123" }
    first_name { "First" }
    last_name { "Last" }
    admin { false }
  end

  factory :admin, class: User do
    email
    password { "test123" }
    first_name { "Admin" }
    last_name { "User" }
    admin { true }
  end
end
