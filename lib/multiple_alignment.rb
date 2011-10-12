class MultipleAlignment
  
  attr_reader :center_string, :as_align, :distance
  
  def initialize(dna, idx_center_string)
    @as_strands = dna.all_strands
    @s_center_string = String.new(@as_strands[idx_center_string])
    @as_align = Array.new
    @as_align << String.new(@s_center_string)
    @as_strands.delete_at(idx_center_string)
    align_all
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
    @distance = total_score2(@as_align)
    return @as_align
  end
  
  def next_alignment
  
    mg = ManhattanGraph.new(@s_center_string, @as_strands[0])
    a_pair_alignment = mg.alignment
    
    i = 0
    until @as_align[0].size == a_pair_alignment[0].size
      if !@as_align[0][i].nil? and @as_align[0][i].chr == "-" and a_pair_alignment[0][i] != @as_align[0][i]
        a_pair_alignment[0].insert(i, "-")
        a_pair_alignment[1].insert(i, "-")
      elsif a_pair_alignment[0][i].chr == "-" and a_pair_alignment[0][i] != @as_align[0][i]
        space_insert(i)
      end
      i += 1
    end

    append(a_pair_alignment[1])
    @as_strands.delete_at(0)
  end
  
end
