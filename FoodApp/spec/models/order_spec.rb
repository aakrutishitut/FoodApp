require "rails_helper"
RSpec.describe Restaurant, :type => :model do
  context 'validation tests' do

        let(:order) {build(:random_order) }
        #user = build(:user)

        it "ensures user_id presence" do
            order.user_id = nil
            expect(order.save).to eq(false)
        end

        it "ensures restaurant_id presence" do
            order.restaurant_id = nil
            expect(order.save).to eq(false)
        end

        it "ensures total presence" do
            order.total = nil
            expect(order.save).to eq(false)
        end

        # it "ensures phone number presence" do
        #     user.phone = nil
        #     expect(user.save).to eq(false)
        # end

        # it "ensures email presence" do
        #     user.email = nil
        #     expect(user.save).to eq(false)
        # end

        it "should save successfully" do
            expect(user.save).to eq(true)
         end

        # before(:all) do
        #     @user1 = create(:user)
        # end
        
        # it "is valid with valid attributes" do
        #     expect(@user1).to be_valid
        # end
        
        # it "has a unique username" do
        #     user2 = build(:user, email: "bob@gmail.com")
        #     expect(user2).to_not be_valid
        # end
        
        # it "has a unique email" do
        #     user2 = build(:user, username: "Bob")
        #     expect(user2).to_not be_valid
        # end
        
        # it "is not valid without a password" do 
        #     user2 = build(:user, password: nil)
        #     expect(user2).to_not be_valid
        # end
        
        # it "is not valid without a username" do 
        #     user2 = build(:user, username: nil)
        #     expect(user2).to_not be_valid
        # end
        
        # it "is not valid without an email" do
        #     user2 = build(:user, email: nil)
        #     expect(user2).to_not be_valid
        # end
    end
end