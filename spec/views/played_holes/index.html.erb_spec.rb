require 'spec_helper'

describe "played_holes/index" do
  before(:each) do
    assign(:played_holes, [
      stub_model(PlayedHole),
      stub_model(PlayedHole)
    ])
  end

  it "renders a list of played_holes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
