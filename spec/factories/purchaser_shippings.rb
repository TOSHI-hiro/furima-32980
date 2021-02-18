FactoryBot.define do
  factory :purchaser_shipping do
    post_numbers         {"333-3333"}
    city                 {"太宰府市"}
    address              {"帯広"}
    phone_numbers        {"09087659787"}
    purchaser_id         {1}
    prefecture_id        {2}
    token {"tok_abcdefghijk00000000000000000"}
    building            {"ビル"}
    

  end
end
