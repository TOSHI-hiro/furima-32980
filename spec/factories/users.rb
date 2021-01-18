FactoryBot.define do
   factory :user do 
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {"あ"}
    last_name {"あ"}
    first_name_kana {"ア"}
    last_name_kana {"ア"}
    date_of_birth {"1990-10-03"}
  end
end