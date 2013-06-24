module GuestsHelper
  def row_styles(guests)
    @row_styles ||= Guests.new(guests).table_row_styles
  end

  def row_style_for(id, guests)
    row_styles(guests)[id]
  end
end
