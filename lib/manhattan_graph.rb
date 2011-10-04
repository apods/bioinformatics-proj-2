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
  
  def alignment
    path = Array.[]("", "")
    curr_node = Array.[](@distances.size - 1, @distances[0].size - 1)
    next_node = max_neighbor(curr_node)
    
    if angle_neighbor(curr_node, next_node)
      path[0] = path[0] + @u[next_node[0]].chr.to_s
      path[1] = path[1] + @v[next_node[1]].chr.to_s
    #elsif up_neighbor(curr_node, next_node)
      
    #elsif left_neighbor(curr_node, next_node)
      
    end
    return path
  end
  
  def angle_neighbor(curr_node, next_node)
    return false unless curr_node[0] == next_node[0] + 1 and curr_node[1] == next_node[1] + 1
    return true
  end
  
  def up_neighbor(curr_node, next_node)
    return false unless curr_node[0] == next_node[0] + 1 and curr_node[1] == next_node[1]
    return true
  end
  
  def left_neighbor(curr_node, next_node)
    return false unless curr_node[0] == next_node[0] and curr_node[1] == next_node[1] + 1
    return true
  end
  
  def max_neighbor(node)
    i = node[0]
    j = node[1]
    max = max(Array.[](@distances[i-1][j], 
                       @distances[i][j-1],
                       @distances[i-1][j-1]))
                       
    if max == @distances[i-1][j-1]
      return Array.[](i-1, j-1)
    elsif max == @distances[i-1][j]
      return Array.[](i-1, j)
    else
      return Array.[](i, j-1)
    end 
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
