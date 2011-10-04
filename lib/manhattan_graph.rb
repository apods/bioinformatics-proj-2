class ManhattanGraph
  
  
  
  def initialize(u, v)
    @u = u
    @v = v                    #rows                 #cols
    @distances = Array.new(u.size + 1) { Array.new(v.size + 1) }
    initialize_first_nodes
    initialize_graph
  end
  
  def initialize_first_nodes
    @distances[0][0] = 0
    for i in 1 .. @distances.size - 1
      @distances[i][0] = i * -1
    end
    for j in 1 .. @distances[0].size - 1
      @distances[0][j] = j * -1
    end
  end
  
  def initialize_graph
    for i in 1 .. @distances.size - 1
      for j in 1 .. @distances[0].size - 1
        if @u[i-1] == @v[j-1]
          angle_weight = 1
        else
          angle_weight = -1
        end
        @distances[i][j] = max(Array.[](@distances[i-1][j] + -1, 
                                        @distances[i][j-1] + -1,
                                        @distances[i-1][j-1] + angle_weight))
      end
    end
  end
  
  def max_path
    
  end
  
  def max_neighbor(i, j)
    
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
  
  def sdistance(i, j, val)
    @distances[i][j] = val
  end
  def distance(i, j)
    puts @distances[j][i]
  end  
  
  
  def print_graph2
    for i in 0 .. @distances.size - 1
      puts @distances[i]
    end
  end
  
  def print_graph
    line = String.new
    for i in 0 .. @distances.size - 1
      line = ""
      for j in 0 .. @distances[0].size - 1
        if @distances[i][j].to_s.size == 2
          line = line + " "
        else
          line = line + "  "
        end
        line = line + @distances[i][j].to_s
      end
      puts line
    end
  end
  
end
