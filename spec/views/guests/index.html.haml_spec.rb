require 'spec_helper'

describe "guests/index" do
  before(:each) do
    assign(:guests, [
      stub_model(Guest,
        :address_id => 1,
        :guest_id => 2,
        :first_name => "First Name",
        :last_name => "Last Name",
        :title => "Title",
        :email => "Email",
        :twenty_one => false,
        :eighteen => true
      ),
      stub_model(Guest,
        :address_id => 1,
        :guest_id => 2,
        :first_name => "First Name",
        :last_name => "Last Name",
        :title => "Title",
        :email => "Email",
        :twenty_one => false,
        :eighteen => true
      )
    ])
  end

  it "renders a list of guests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => true.to_s, :count => 2
  end
end