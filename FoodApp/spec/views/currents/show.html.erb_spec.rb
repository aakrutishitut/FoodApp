require 'rails_helper'

RSpec.describe "currents/show", type: :view do
  before(:each) do
    @current = assign(:current, Current.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
