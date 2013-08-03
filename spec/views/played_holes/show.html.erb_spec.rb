require 'spec_helper'

describe "played_holes/show" do
  before(:each) do
    @played_hole = assign(:played_hole, stub_model(PlayedHole))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
