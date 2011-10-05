$LOAD_PATH << './lib'
require 'dna'
require 'proj_math'
require 'distance_array'
require 'multiple_alignment'
require 'manhattan_graph'

# DNA is either the file name typed at the terminal or test_1.txt if no file
# name was given
o_dna = DNA.new("./test_cases/" + (ARGV.first || "test_1.txt"))
distances = DistanceArray.new(o_dna)

a_center_string = find_center_string(distances)
o_alignment = MultipleAlignment.new(o_dna, a_center_string[1])

puts "Best Star Cost: " + a_center_string[0].to_s
puts "Total Cost: " + o_alignment.distance.to_s
puts o_alignment.as_align
