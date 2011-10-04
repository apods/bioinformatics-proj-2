class MultipleAlignment
  
  attr_reader :center_string, :as_align
  
  def initialize(dna, idx_center_string)
    @as_strands = dna.all_strands
    @s_center_string = String.new(@as_strands[idx_center_string])
    @as_align = Array.new
    @as_align << @s_center_string
    @as_strands.delete_at(idx_center_string)
  end
  
  def append(string)
    @as_align << string
  end
  
  def space_insert(idx)
    @as_align.each_index do |seq|
      @as_align[seq].insert(idx, "-")
    end
  end
  
  def align_all
    unless @as_strands.empty?
      next_alignment
    end
    return @as_align
  end
  
  def next_alignment
    puts "Alignment:"
    puts "\tCenter String: " + @s_center_string
    puts "\tStrand: " + @as_strands[0]
    mg = ManhattanGraph.new(@s_center_string, @as_strands[0])
    a_pair_alignment = mg.alignment
    for i in 0 .. a_pair_alignment[0].size
      space_insert(i) unless a_pair_alignment[0][i].chr != "-"
    end
    append(a_pair_alignment[1])
    @as_strands.delete_at(0)
  end
  
end
