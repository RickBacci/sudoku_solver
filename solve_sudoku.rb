require_relative 'generate_matrix'

require_relative 'clear_all'
require_relative 'total_numbers_remaining'
require_relative 'ranges'
require_relative 'solve_for_one'
require_relative 'solve_for_two'
require_relative 'foo'

require_relative 'validation'
require_relative 'print_puzzle'

def initial_setup(array)
  clear_all(array)
  print_initial_puzzle(array)
  @history = []
  @loops = 0
 
  array
end

def history
  @history ||= []
end

# def loops
#   @loops
# end

def puzzle_finished?(array)
  if @loops == 50
    puts
    p "stopped after #{@loops} loops"
  elsif add_puzzle(array) && no_arrays?(array)
    history << "puzzle solved after #{@loops} recursions" << valid_puzzle?(array)
  else
    solve_puzzle(array)
  end
end

def add_puzzle(array)
  array.flatten.reduce { |a, e| a + e } == 405
end

def solve_puzzle(array)
  check_sizes(array)
  solve_for_one(array)
  solve_for_two(array)
  
  @loops += 1

  puzzle_finished?(array)
end

array = generate_matrix(sudoku)

initial_setup(array)
solve_puzzle(array)


print_history
print_final_puzzle(array)
