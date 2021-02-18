FactoryBot.define do
  factory :item do
  factory :user do
    product_name           {Faker::Games::Zelda.item}
    subscription      {Faker::Games::Zelda.game}
    category_id     {2}
    status_id       {2}
    shipping_id     {2}
    prefecture_id   {2}
    deadline_id     {2}
    price           {Faker::Number.number(digits: 4)}



     after(:build) do |item|
       item.image.attach(io: File.open('public/images/comment.png'), filename: 'comment.png')
     end
    end
  end
end