require 'guests'

describe Guests do

  let(:guest1) { {"id"=>1, "address_id"=>1,   "guest_id"=>nil, "first_name"=>"hal", "last_name"=>"pal", "title"=>nil, "email"=>"as@as.com", "twenty_one"=>true, "eighteen"=>false }  }
  let(:guest2) { {"id"=>2, "address_id"=>1, "guest_id"=>1, "first_name"=>"Billy", "last_name"=>"Blanks", "title"=>nil, "email"=>"bb@bb.com", "twenty_one"=>false, "eighteen"=>true } }
  let(:guesta) { {"id"=>3, "address_id"=>2,   "guest_id"=>nil, "first_name"=>"hal", "last_name"=>"pal", "title"=>nil, "email"=>"as@as.com", "twenty_one"=>true, "eighteen"=>false }  }
  let(:guestb) { {"id"=>4, "address_id"=>2, "guest_id"=>3, "first_name"=>"Billy", "last_name"=>"Blanks", "title"=>nil, "email"=>"bb@bb.com", "twenty_one"=>false, "eighteen"=>true } }
  let(:guests) { [ guest1, guest2, guesta, guestb] }
  let(:row_styles) { { 1 => "success", 2 => "success", 3 => "info", 4 => "info" }}

  it 'counts number of guest groups' do
    Guests.new(guests).group_count.should == 2
  end

  it 'assign table row style' do
    Guests.new(guests).table_row_styles.should == row_styles
  end

  it 'has parents' do
    Guests.new(guests).parents.should == [guest1, guesta]
  end

  it 'has parents ids' do
    Guests.new(guests).parent_ids.should == [1, 3]
  end

  it 'has children' do
    Guests.new(guests).children.should == [guest2, guestb]
  end

  it 'has children ids' do
    Guests.new(guests).children_ids.should == [2, 4]
  end

end

