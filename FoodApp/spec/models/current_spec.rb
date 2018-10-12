require "rails_helper"
RSpec.describe Restaurant, :type => :model do
  context 'validation tests' do

        let(:item) {build(:random_current) }
        #user = build(:user)

        it "ensures name presence" do
            item.name=nil
            expect(item.save).to eq(false)
        end

        it "ensures quantity presence" do
            item.quantity = nil
            expect(item.save).to eq(false)
        end

        it "ensures amount presence" do
            item.amount = nil
            expect(item.save).to eq(false)
        end

        # it "ensures phone number presence" do
        #     user.phone = nil
        #     expect(user.save).to eq(false)
        # end

        # it "ensures email presence" do
        #     user.email = nil
        #     expect(user.save).to eq(false)
        # end

        # it "should save successfully" do
        #     expect(user.save).to eq(true)
        # end

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