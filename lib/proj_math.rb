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
  distance_sum = 0
  best_sum = Array.[](9999999999999999999999999999, 0)
  
  for i in 0 .. o_distances.rows - 1
    
    
    
    
    for j in 0 .. o_distances.cols - 1
      
      distance_sum += o_distances.distance(i, j) unless i == j
      
      
      
    end
    
    if distance_sum < best_sum[0]
      best_sum[0] = distance_sum
      best_sum[1] = i
    end
    
    
  end
  
  
  
  return best_sum[1]
end


















