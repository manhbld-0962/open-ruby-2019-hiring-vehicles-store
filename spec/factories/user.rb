FactoryBot.define do
  factory :User do
    name {FFaker::Name.name}
    email {email = FFaker::Internet.unique.email.upcase}
    password {Settings.default_pass}
    password_confirmation {Settings.default_pass}
  end
end
