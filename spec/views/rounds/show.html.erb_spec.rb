require 'spec_helper'

describe "rounds/show" do
  before(:each) do
    @round = assign(:round, stub_model(Round))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
