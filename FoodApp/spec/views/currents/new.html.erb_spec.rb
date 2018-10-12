require 'rails_helper'

RSpec.describe "currents/new", type: :view do
  before(:each) do
    assign(:current, Current.new())
  end

  it "renders new current form" do
    render

    assert_select "form[action=?][method=?]", currents_path, "post" do
    end
  end
end
