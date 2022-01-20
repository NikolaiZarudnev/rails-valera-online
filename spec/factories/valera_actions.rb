FactoryBot.define do
  factory :valera_action do
    name { "MyString" }
    cond_attr { "MyString" }
    min { 1 }
    max { 1 }
    health { 1 }
    alcohol { 1 }
    happy { 1 }
    tired { 1 }
    money { 1 }
    change_eff_name { "MyString" }
    change_eff_value { 1 }
  end
end
