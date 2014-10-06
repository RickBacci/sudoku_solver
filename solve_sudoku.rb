require_relative 'starting_matrix'

require_relative 'clear_all'
require_relative 'check_sizes'
require_relative 'total_numbers_remaining'
require_relative 'ranges'
require_relative 'solve_for_one'
require_relative 'solve_for_two'
require_relative 'foo'

require_relative 'validation'
require_relative 'print_puzzle'
require_relative 'solve_for'


def initial_setup(array)

  clear_all(array)
  print_initial_puzzle(array)
  @history = []
  @loops = 0
 
  array
end


def solve_puzzle(array)
  
  check_sizes(array)
   
  if (@size1 > 0)
    solve_for_one(array)
  elsif @size2 > 0
    solve_for_two(array)
  end
  
  done = array.flatten.inject(0) { |total, value| total + value }
  @loops += 1

  if @loops == 50
    puts
    p "stopped after #{@loops} loops"
    return
  elsif done == 405 && no_arrays?(array)
    @history << "puzzle solved after #{@loops} recursions"
    return
  else
    solve_puzzle(array)
  end
end


#diabolical
#sudoku = '140060300050000000300087204000000056002000700780000000501690002000000060006010049'
#sudoku = '200300500050040000009000041600420805000000000904056007420000900000010070006005003'
#sudoku = '020001089108003004060700000000000200500607003003000000000004030700900401940100070'
#sudoku = '100008309060040020209000000000500807000706000706003000000000705050010040904800006'
#sudoku = '006080100080246070200050008002408600000000000900010003020000080400901006709060301'

#very hard
#sudoku = '007000500050109060300050002500000007004000800890000016400060008002000600605743901'
#sudoku = '200308406100000000000607008000000209070090080602000000700903000000000003906705001'
#sudoku = '006030800000408000400050003102000906790060032000020000524000798031000650600040001'

#hard
#sudoku = '400305000006000007580000010120003000300408006000700043010000059900000200000906001'
#sudoku = '200050009100709003009000600000203000500491007003080200004000700720000036830070012'


#moderate
## row7 [2,7], [1,2,7], and [1,2,7] does not clear col2 and col5
sudoku = '007300509300002000400080003600050030003000600090060002800030005000600004706001300'


#mild
#sudoku = '200147008008000600000060000100503004730020065005000200001604800600982001903000406'


  array = generate_matrix(sudoku)
  
  initial_setup(array)
  solve_puzzle(array)

  @history << valid_puzzle?(array)

  print_history
  print_final_puzzle(array)


