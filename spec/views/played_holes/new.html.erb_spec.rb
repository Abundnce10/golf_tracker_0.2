require 'spec_helper'

describe "played_holes/new" do
  before(:each) do
    assign(:played_hole, stub_model(PlayedHole).as_new_record)
  end

  it "renders new played_hole form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => played_holes_path, :method => "post" do
    end
  end
end
