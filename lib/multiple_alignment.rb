class MultipleAlignment
  
  attr_reader :center_string, :as_align
  
  def initialize(dna, idx_center_string)
    @as_strands = dna.all_strands
    @s_center_string = String.new(@as_strands[idx_center_string])
    @as_align = Array.new
    @as_align << String.new(@s_center_string)
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
    until @as_strands.empty?
      next_alignment
    end
    return @as_align
  end
  
  def next_alignment
  
    puts "Alignment:"
    
    mg = ManhattanGraph.new(@s_center_string, @as_strands[0])
    a_pair_alignment = mg.alignment
    
    puts "\t" + a_pair_alignment[0]
    puts "\t" + a_pair_alignment[1]
    puts "\n"
    
    for i in 0 .. a_pair_alignment[0].size - 1
      space_insert(i) unless a_pair_alignment[0][i].chr != "-"
    end
    append(a_pair_alignment[1])
    @as_strands.delete_at(0)
  end
  
end
