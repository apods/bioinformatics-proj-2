class DistanceArray
  
  def initialize(dna)
    @dna = dna
    @distances = Array.new(dna.num_strands) { Array.new(dna.num_strands) }
    calc_distances
  end
  
  def calc_distances
    for i in 0 .. @dna.num_strands - 1
      for j in 0 .. @dna.num_strands - 1
        if i != j
          @distances[j][i] = @distances[i][j] = score(@dna.strand(i), @dna.strand(j))
        else
          @distances[i][j] = nil
        end
      end
    end
  end
  
  def distance(i, j)
    @distances[i][j]
  end
  
  def rows
    return @distances.size
  end
  
  def cols
    return @distances.size
  end
  
end
