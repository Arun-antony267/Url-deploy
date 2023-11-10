
FactoryBot.define do
    factory :user do
      name {'Ashwathy'}
      email { "ashwathy@gmail.com" }
      password {'123'}
      password_confirmation {'123'}
    end
  
    factory :user1 do
      user_name = 'Messi'
      user_email = 'messi@gmail.com'
      user_password = '123'
    end
  end