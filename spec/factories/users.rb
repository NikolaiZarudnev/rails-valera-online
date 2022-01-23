FactoryBot.define do
  factory :user do
    email { 'test@gmail.com' }
    name { 'test' }
    password_digest { 'test' }
    health { 1 }
    alcohol { 1 }
    happy { 1 }
    tired { 1 }
    money { 1 }
  end
end
