require "rails_helper"
require "devise"

RSpec.describe OrdersController, :type => :controller do
  
  describe "GET index" do
    let (:user) do
      # @request.env["devise.mapping"] = Devise.mappings[:admin]
      build(:random_user)# Using factory bot as an example
    end
    it "doesn't matter" do
    end
    # it "renders the index template" do
    #   get :index
    #   expect(response).to render_template("index")
    # end
  end
end


# describe Client::WebformsController, type: :controller do
#   let!(:client){FactoryGirl.create(:client)}
#   let!(:user){FactoryGirl.create(:user, role: "support_manager", client: client)}
#   let(:webform){FactoryGirl.build(:webform, client: client)}
#   before(:each) do
#     sign_in user
#     request.env["HTTP_ACCEPT"] = "application/json"
#   end

#   describe "GET index" do
#     it "should return all records for webforms" do
#       get :index, {client_id: client.id}
#       results = JSON.parse(response.body)["results"]
#       expect(results).to match_array(client.webforms.collect{|x| x.to_json.transform_keys(&:to_s)})
#     end

#     it "should return data for webforms select2" do
#       get :data_provider, {client_id: client.id, reports: "reports"}
#       results = JSON.parse(response.body)
#       json = client.webforms.only(:id,:name,:active, :client_id).collect{|x| x.to_json.transform_keys(&:to_s)}
#       expect(results).to match_array(json)
#     end

#     it "should return new webform object" do
#       get :new, {client_id: client.id}
#       expect(assigns(@webform)["webform"].new_record?).to be_truthy
#     end

#     it "should create new webform object" do
#       expect{post :create, {webform: webform.as_json}}.to change(Webform, :count).by(1)
#     end