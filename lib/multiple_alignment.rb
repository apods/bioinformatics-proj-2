class MultipleAlignment
  
  attr_reader :center_string
  
  def initialize(center_string)
    @center_string = String.new(center_string)
    @a_align = Array.new
    @a_align << @center_string
  end
  
  def append(string)
    @_align << string
  end
  
  def space_insert(idx)
    @a_align.each_index do |seq|
      @_align[seq].insert(idx, "-")
    end
  end
  
end
