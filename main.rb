$LOAD_PATH << './lib'
require 'dna'
require 'proj_math'
require 'sc'

# DNA is either the file name typed at the terminal or test_1.txt if no file
# name was given
dna = DNA.new("./test_cases/" + (ARGV.first || "test_1.txt"))
sc = SC.new



