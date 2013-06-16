class FormalTitle
  def self.titles
    ['Mr.', 'Ms.', 'Mrs.', 'Dr.']
  end

  def self.options_for_select
    titles.each_with_index.map { |title, index| [title, index + 1] }
  end
end
