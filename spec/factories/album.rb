FactoryGirl.define do
  factory :album do
    title         "Nevermind"
    artist        "Nirvana"
    release_date  DateTime.now
  end
end