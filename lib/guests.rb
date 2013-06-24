class Guests

  def initialize(guests)
    @guests = guests
  end

  def group_count
    @group_count ||= group_ids.uniq.size - 1
  end

  def group_ids
    @group_ids ||= @guests.map { |g| g["guest_id"] }
  end

  def parents
    @parents ||= @guests.select { |g| g["guest_id"] == nil }
  end

  def parent_ids
    @parent_ids ||= parents.map { |g| g["id"] }
  end

  def children
    @children ||= @guests.select { |g| g["guest_id"]}
  end

  def children_ids
    @children_ids ||= children.map { |g| g["id"] }
  end


  def table_row_styles
    styles = parent_styles
    parent_styles.merge(child_styles(parent_styles))
  end

  def child_styles(styles)
    child_styles = {}
    children.each do |child|
      child_styles[child["id"]] = styles[child["guest_id"]]
    end
    child_styles
  end

  def parent_styles
    parent_styles = {}
    parents.each_with_index do |parent, index|
      if index % 2 == 0
        parent_styles[parent["id"]] = "success"
      else
        parent_styles[parent["id"]] = "info"
      end
    end
    parent_styles
  end

end
