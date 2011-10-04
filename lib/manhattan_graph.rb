class ManhattanGraph
  
  def initialize(u, v)
    @distances = Array.new(u.size + 1) { Array.new(v.size + 1) }
    initialize_first_nodes
  end
  
  def initialize_first_nodes
    @distances[0][0] = 0
    for i in 1 .. @distances.size - 1
      @distances[i][0] = i * -1
    end
    for j in 1 .. @distances[0].size - 1
      @distances[0][j] = j * -1
    end
    puts "Initialization:"
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
        line = line + @distances[i][j].to_s
        if @distances[i][j].to_s.size == 2
          line = line + " "
        else
          line = line + "  "
        end
      end
      puts line
    end
  end
  
end
