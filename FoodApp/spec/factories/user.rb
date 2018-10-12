#require 'faker'
#I18n.reload!                 #to be used if faker isn't loading

FactoryBot.define do
    factory :random_user,class: User do
        name {Faker::Name.name}
        email {Faker::Internet.email}
        password {"uchiha3377"}
        # #encrypted_password: { Devise.bcrypt(User, 'password')}
        # encrypted_password { Devise::Encryptor.digest(User, 'password') }
        # #encrypted_password: <%= User.new.send(:password_digest, '1234567890') %>
        #confirmation_token { SecureRandom.urlsafe_base64.to_s }
        confirmed_at { Time.zone.now - 1.hour }
        confirmation_sent_at { Time.zone.now - 2.hours }
        created_at {Time.zone.now}
        updated_at {Time.zone.now}
        typeofu {"customer"}
        # # academics {Faker::Lorem.words(6, true)}
        # awards {Faker::Lorem.words(6, true)}
        # active {Faker::Boolean.boolean(0.5)}
      end
  end