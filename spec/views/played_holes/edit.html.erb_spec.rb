require 'spec_helper'

describe "played_holes/edit" do
  before(:each) do
    @played_hole = assign(:played_hole, stub_model(PlayedHole))
  end

  it "renders the edit played_hole form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => played_holes_path(@played_hole), :method => "post" do
    end
  end
end
