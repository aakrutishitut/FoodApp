require 'rails_helper'

RSpec.describe "currents/index", type: :view do
  before(:each) do
    assign(:currents, [
      Current.create!(),
      Current.create!()
    ])
  end

  it "renders a list of currents" do
    render
  end
end
