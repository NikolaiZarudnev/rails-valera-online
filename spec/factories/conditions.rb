FactoryBot.define do
  factory :condition do
    attr_name { 'MyString' }
    min { 1 }
    max { 1 }
    attr_name_eff { 'MyString' }
    value_eff { 1 }
    valeraaction { nil }
  end
end
