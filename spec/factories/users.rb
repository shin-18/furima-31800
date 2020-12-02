FactoryBot.define do
  factory :user do
    nickname              {"やまもと"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    surname           {"田中"}
    name            {"花子"}
    surname_kana      {"タナカ"}
    name_kana       {"ハナコ"}
    birthday_id             {"2020-08-04"}
  end
end
