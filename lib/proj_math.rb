def total_score(o_dna)
  score = 0
  num_strands = dna.num_strands
  strands = dna.all_strands
  
  strands.each_index do |i|
    for j in i + 1 .. num_strands - 1
      score += score(strands[i], strands[j])
    end
  end
  
  
  return score
end

def score(u, v)
  score = 0
  w = u.chars.to_a
  x = v.chars.to_a
  
  w.each_index do |i|
    if w[i] != x[i]
      score += 1
    end
  end
  
  return score
end

def find_center_string(o_distances)
  strands = dna.all_strands
  min_strand = Array.[](strands[0], 0)
  
  for i in 0 .. strands.size - 1
    for j in 0 .. strands.size - 1
      
      if i != j
        min_strand = strands[j] unless score
      end
      
    end
  end
  
  
  
  return min_strand
end
