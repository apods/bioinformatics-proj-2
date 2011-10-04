$LOAD_PATH << './lib'
require 'dna'
require 'proj_math'
require 'distance_array'
require 'multiple_alignment'
require 'manhattan_graph'

# DNA is either the file name typed at the terminal or test_1.txt if no file
# name was given
dna = DNA.new("./test_cases/" + (ARGV.first || "test_1.txt"))
distances = DistanceArray.new(dna)

index_of_center_string = find_center_string(distances)
alignment = MultipleAlignment.new(dna.strand(index_of_center_string))

mg = ManhattanGraph.new("AXZ", "AXXZ")
mg.print_graph

