require 'spec_helper'

describe "systems/show" do
  before(:each) do
    @system = assign(:system, stub_model(System,
      :name => "Name",
      :location => "Location",
      :description => "Description",
      :contact => "Contact",
      :serialNumber => 1,
      :hardwareVersion => "Hardware Version",
      :softwareVersion => "Software Version",
      :dbVersion => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Location/)
    rendered.should match(/Description/)
    rendered.should match(/Contact/)
    rendered.should match(/1/)
    rendered.should match(/Hardware Version/)
    rendered.should match(/Software Version/)
    rendered.should match(/2/)
  end
end
