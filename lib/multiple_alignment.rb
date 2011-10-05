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
    #mg = ManhattanGraph.new(@as_align[0], @as_strands[0])
    a_pair_alignment = mg.alignment
    
    
    
    for i in 0 .. max(Array.[](a_pair_alignment[0].size, @as_align[0].size)) - 1
      if @as_align[0][i].chr == "-" and a_pair_alignment[0][i] != @as_align[0][i]
        a_pair_alignment[0].insert(i, "-")
        a_pair_alignment[1].insert(i, "-")
      elsif a_pair_alignment[0][i].chr == "-" and a_pair_alignment[0][i] != @as_align[0][i]
        space_insert(i)
      end
    end


    # Align old string to new
    # Align new string to old

=begin   
    # If a space was inserted into the center string, check to see if it needs
    # to be inserted into the multiple alignment as well
    for i in 0 .. a_pair_alignment[0].size - 1
      space_insert(i) unless ((a_pair_alignment[0][i].chr != "-") or (@as_align[0][i].chr == "-"))
    end
    #############################################################
    # Add spaces to the string just aligned if necessary in order to keep it
    # Aligned with the center string when inserted
    counter_i = 0
    space_additions = Array.new
    for j in 0 .. a_pair_alignment[1].size - 1
      until a_pair_alignment[0][j] == @as_align[0][counter_i]
        space_additions << counter_i
        counter_i += 1
      end
      
      counter_i += 1
    end
    space_additions.each { |idx| a_pair_alignment[1].insert(idx, "-") }
    
    ###########################################################
=end

    append(a_pair_alignment[1])
    @as_strands.delete_at(0)
  end
  
end
