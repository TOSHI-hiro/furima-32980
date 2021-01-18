FactoryBot.define do
   factory :user do 
    name {"aaaaaa"}
    email {Faker::Internet.free_email}
    password {"hoge12"}
    password_confirmation {"hoge12"}
    first_name {"あ"}
    last_name {"あ"}
    first_name_kana {"ア"}
    last_name_kana {"ア"}
    date_of_birth {"1990-10-03"}
  end
end