def total_score(dna)
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
