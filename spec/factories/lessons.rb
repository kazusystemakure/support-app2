FactoryBot.define do
  factory :lesson do
    name { 'フィットネスクラス' }
    text { 'フィットネスで痩せよう' }
    price { 1000 }
    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
