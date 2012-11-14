require 'spec_helper'

describe "systems/index" do
  before(:each) do
    assign(:systems, [
      stub_model(System,
        :name => "Name",
        :location => "Location",
        :description => "Description",
        :contact => "Contact",
        :serialNumber => 1,
        :hardwareVersion => "Hardware Version",
        :softwareVersion => "Software Version",
        :dbVersion => 2
      ),
      stub_model(System,
        :name => "Name",
        :location => "Location",
        :description => "Description",
        :contact => "Contact",
        :serialNumber => 1,
        :hardwareVersion => "Hardware Version",
        :softwareVersion => "Software Version",
        :dbVersion => 2
      )
    ])
  end

  it "renders a list of systems" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Hardware Version".to_s, :count => 2
    assert_select "tr>td", :text => "Software Version".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
