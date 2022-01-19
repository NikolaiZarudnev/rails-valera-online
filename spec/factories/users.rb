FactoryBot.define do
  factory :user do
    email { "MyString" }
    name { "MyString" }
    password_digest { "MyString" }
    health { 1 }
    alcohol { 1 }
    happy { 1 }
    tired { 1 }
    money { 1 }
  end
end
