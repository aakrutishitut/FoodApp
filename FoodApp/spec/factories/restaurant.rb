#require 'faker'
#I18n.reload!                 #to be used if faker isn't loading

FactoryBot.define do
    factory :random_restaurant,class: Restaurant do
        name {Faker::Name.name}
        rate_for_two {Faker::Number.number(3)}
        # academics {Faker::Lorem.words(6, true)}
        # awards {Faker::Lorem.words(6, true)}
        # active {Faker::Boolean.boolean(0.5)}
      end
  end