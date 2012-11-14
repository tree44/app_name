require 'spec_helper'

describe "systems/edit" do
  before(:each) do
    @system = assign(:system, stub_model(System,
      :name => "MyString",
      :location => "MyString",
      :description => "MyString",
      :contact => "MyString",
      :serialNumber => 1,
      :hardwareVersion => "MyString",
      :softwareVersion => "MyString",
      :dbVersion => 1
    ))
  end

  it "renders the edit system form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => systems_path(@system), :method => "post" do
      assert_select "input#system_name", :name => "system[name]"
      assert_select "input#system_location", :name => "system[location]"
      assert_select "input#system_description", :name => "system[description]"
      assert_select "input#system_contact", :name => "system[contact]"
      assert_select "input#system_serialNumber", :name => "system[serialNumber]"
      assert_select "input#system_hardwareVersion", :name => "system[hardwareVersion]"
      assert_select "input#system_softwareVersion", :name => "system[softwareVersion]"
      assert_select "input#system_dbVersion", :name => "system[dbVersion]"
    end
  end
end
