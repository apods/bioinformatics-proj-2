def min(min_array)
  min = min_array[0]
  for i in 1 .. min_array.size - 1
    if min_array[i] < min
      min = min_array[i]
    end
  end
  return min
end

def max(max_array)
  max = max_array[0]
  for i in 1 .. max_array.size - 1
    if max_array[i] > max
      max = max_array[i]
    end
  end
  return max
end

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

def total_score2(as_alignment)
  score = 0
  num_strands = as_alignment.size
  strands = as_alignment
  
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

def score2(u, v)  # edit distance
  distances = Array.new(u.size + 1) { Array.new(v.size + 1) }

  for i in 0 .. u.size
    distances[i][0] = i
  end
  for j in 0 .. v.size
    distances[0][j] = j
  end
  
  for i in 1 .. u.size
    for j in 1 .. v.size
      
      if u[i] == v[j]
        distances[i][j] = distances[i-1][j-1]
      else
        distances[i][j] = min(Array.[]( distances[i-1][j] + 1, distances[i][j-1] + 1, distances[i-1][j-1] + 1))
      end
    end
  end
  
  return distances[u.size][v.size]
end

def find_center_string(o_distances)
  distance_sum = 0
  best_sum = Array.[](9999999999999999999999999999, 0)
  
  for i in 0 .. o_distances.rows - 1
    distance_sum = 0
    for j in 0 .. o_distances.cols - 1
      distance_sum += o_distances.distance(i, j) unless i == j
    end
    if distance_sum < best_sum[0]
      best_sum[0] = distance_sum
      best_sum[1] = i
    end
  end
  
  return best_sum
end
















