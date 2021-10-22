FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'00000a'}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_kana            {"タロウ"}
    last_kana             {"ヤマダ"}
    birth                 {"2000-01-01"}
  end
end