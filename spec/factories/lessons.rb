FactoryBot.define do
  factory :lesson do
    name { 'いざハードワーク' }
    level_id { 2 }
    text { 'フィットネスで痩せよう' }
    price { 1000 }
    lesson_date { '20201101' }
    bigin_at {'13:00:00'}
    closed_at {'13:30:00'}
    zoom_url {'https://www.yahoo.co.jp/'}
    zoom_password {'1234abcd'}
    association :user
    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
