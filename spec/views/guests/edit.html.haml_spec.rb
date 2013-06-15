require 'spec_helper'

describe "guests/edit" do
  before(:each) do
    @guest = assign(:guest, stub_model(Guest,
      :address_id => 1,
      :guest_id => 1,
      :first_name => "MyString",
      :last_name => "MyString",
      :title => "MyString",
      :email => "MyString",
      :twenty_one => false,
      :eighteen => false
    ))
  end

  it "renders the edit guest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", guest_path(@guest), "post" do
      assert_select "input#guest_address_id[name=?]", "guest[address_id]"
      assert_select "input#guest_guest_id[name=?]", "guest[guest_id]"
      assert_select "input#guest_first_name[name=?]", "guest[first_name]"
      assert_select "input#guest_last_name[name=?]", "guest[last_name]"
      assert_select "input#guest_title[name=?]", "guest[title]"
      assert_select "input#guest_email[name=?]", "guest[email]"
      assert_select "input#guest_twenty_one[name=?]", "guest[twenty_one]"
      assert_select "input#guest_eighteen[name=?]", "guest[eighteen]"
    end
  end
end
