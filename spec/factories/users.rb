FactoryBot.define do
  factory :user do
    name { '鈴木イチロウ' }
    namekana { 'スズキイチロウ' }
    email { Faker::Internet.free_email }
    password { '1234abcd' }
    password_confirmation { '1234abcd' }
    postal_code { '123-4567' }
    prefecture { '北海道' }
    city { '札幌市' }
    address { '札幌1-1' }
    phone_number { '09012345678' }
    hobby { 'エクササイズ' }
    birth_date { '19900202' }

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
