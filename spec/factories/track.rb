FactoryGirl.define do
  factory :track do
    number 1
    title 'Smells Like Teen Spirit'
    association :album, factory: :album
  end
end