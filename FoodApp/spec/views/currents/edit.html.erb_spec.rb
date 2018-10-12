require 'rails_helper'

RSpec.describe "currents/edit", type: :view do
  before(:each) do
    @current = assign(:current, Current.create!())
  end

  it "renders the edit current form" do
    render

    assert_select "form[action=?][method=?]", current_path(@current), "post" do
    end
  end
end
