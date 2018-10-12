#require 'faker'
#I18n.reload!                 #to be used if faker isn't loading

FactoryBot.define do
    factory :random_item,class: Item do
        name {Faker::Name.name}
        quantity {Faker::Number.number(2)}
        amount {Faker::Number.number(2)}
        # academics {Faker::Lorem.words(6, true)}
        # awards {Faker::Lorem.words(6, true)}
        # active {Faker::Boolean.boolean(0.5)}
      end
  end