require 'spec_helper'

describe "rounds/index" do
  before(:each) do
    assign(:rounds, [
      stub_model(Round),
      stub_model(Round)
    ])
  end

  it "renders a list of rounds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
