# un-solvable
# SUDOKU = '000800042000001070900002003007000050100030004040000800400900006050200010280006000' # fail bad

# diabolical
# SUDOKU = '160379048000000000030481070310507089580602037000000000000000000040020050003964800' # fail
# SUDOKU = '020001089108003004060700000000000200500607003003000000000004030700900401940100070' # fail
# SUDOKU = '140060300050000000300087204000000056002000700780000000501690002000000060006010049' # pass
# SUDOKU = '200300500050040000009000041600420805000000000904056007420000900000010070006005003' # fail
# SUDOKU = '020001089108003004060700000000000200500607003003000000000004030700900401940100070' # fail
# SUDOKU = '100008309060040020209000000000500807000706000706003000000000705050010040904800006' # fail

# 2's in box5 not clearing
#SUDOKU = '006080100080246070200050008002408600000000000900010003020000080400901006709060301'

# very hard
# SUDOKU = '007000500050109060300050002500000007004000800890000016400060008002000600605743901' # fail
# SUDOKU = '200308406100000000000607008000000209070090080602000000700903000000000003906705001' # fail
# SUDOKU = '006030800000408000400050003102000906790060032000020000524000798031000650600040001' # fail

# hard
# SUDOKU = '400305000006000007580000010120003000300408006000700043010000059900000200000906001' # fail

# SUDOKU = '200050009100709003009000600000203000500491007003080200004000700720000036830070012' # fail
 SUDOKU = '157234689062000540000070000006090300004000900590000014600000005800925006000608000' # fail
# SUDOKU = '107200380250049000000100000001000030500000004090000600000008000000720068076004901' # fail
# SUDOKU = '040600082200000409000005010002003004050000060800700500070800000508000007930001020' # fail

# moderate
# SUDOKU = '007300509300002000400080003600050030003000600090060002800030005000600004706001300' # pass
# SUDOKU = '107009300020001000400070005000530008005000400900024000500040007000700090003900602' # pass
# SUDOKU = '000089460008100000560000100000000894400000007693000000001000083000001900056830000' # pass
# SUDOKU = '130207098208010507009050100004000700090000060700030009002901800900080002047000950' # fail
# SUDOKU = '000200498170008006004500000000100007003000500800003000000001900700900082946002000' # pass
# SUDOKU = '300060829000000004200080500500607080000000000010908006001030008700000000985020001' # pass

# mild
# SUDOKU = '200147008008000600000060000100503004730020065005000200001604800600982001903000406' # pass

class Matrix
  attr_reader :sudoku

  def fill_cell(value)
    if value == '0'
      return [1, 2, 3, 4, 5, 6, 7, 8, 9]
    else
      value.to_i
    end
  end

  def generate_matrix(sudoku)
    puzzle, row = [], []
    sudoku.each_char do |char|

      row << fill_cell(char)
      
      if row.length == 9
        puzzle << row
        row = []
      end
    end
    puzzle
  end
end
