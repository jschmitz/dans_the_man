require 'spec_helper'

describe "guests/show" do
  before(:each) do
    @guest = assign(:guest, stub_model(Guest,
      :address_id => 1,
      :guest_id => 2,
      :first_name => "First Name",
      :last_name => "Last Name",
      :title => "Title",
      :email => "Email",
      :twenty_one => false,
      :eighteen => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Title/)
    rendered.should match(/Email/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
