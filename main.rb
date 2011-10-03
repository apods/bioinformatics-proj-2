$LOAD_PATH << './lib'
require 'dna'
require 'proj_math'
require 'sc'

# DNA is either the file name typed at the terminal or test_1.txt if no file
# name was given
dna = DNA.new("./test_cases/" + (ARGV.first || "test_1.txt"))
distances = DistanceArray.new(dna)

index_of_center_string = find_center_string(distances)

