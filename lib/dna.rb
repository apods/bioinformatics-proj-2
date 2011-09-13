class DNA
  def initialize(file)
    #read every line in the file
    @dna = IO.readlines(file)
    
    #get individual sizes and convert to an integer
    @size = @dna[0].chomp.to_i
    
    @dna = @dna[1, num_strands]
    @dna.each_index do |i|
      @dna[i] = @dna[i].chomp
    end
  end
  
  #return the number of DNA strands
  def num_strands
    @size
  end
  
  #print the DNA strands
  def print
    puts @dna
  end
  
  def all_strands
    @dna
  end
  
  def strand(i)
    @dna[i]
  end
  
  def column(i)
    string = String.new
    @dna.each do |strand|
      string += strand[i].chr
    end
    return string
  end
end

