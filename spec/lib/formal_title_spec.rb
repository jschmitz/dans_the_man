require 'formal_title'

describe FormalTitle do
  it 'has a list of titles' do
    FormalTitle.options_for_select.should == [['Mr.', 1], ['Ms.', 2], ['Mrs.', 3], ['Dr.', 4]]
  end
end
