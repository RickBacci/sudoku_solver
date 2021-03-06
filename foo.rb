
def clear_value2(array, rows, columns, value, location)
  row_to_exclude = location[-1].to_i

  rows.each do |row|
    columns.each do |column|
      unless array[row][column].is_a?(Integer) || row == row_to_exclude
        before = array[row][column]
        array[row][column] -= [value]

        if before != array[row][column] ## Sudoku.history
          Sudoku.history("#{location} [#{row}][#{column}] :clear_box (:values_in_row) --- " \
                       "set from #{before} to #{value}")
        end
      end
    end
  end
end

def clear_box(array, rows, columns, third_with_value, value, index, location)
  temp_array = []
  rows.each do |row|
    columns.each do |column|
      temp_array << array[row][column]
    end
  end
   
 
  tmp = []
  temp_array.each do |val|
    tmp << val
    if tmp.size == 3      
      if tmp != third_with_value
        clear_value2(array, rows, columns, value, location)
      end
      tmp = []
    end
  end
end

def box_affected(location, index)

  if location == :row0 || location == :row1 || location == :row2
    return [(0..2), (0..2)] if index == 0
    return [(0..2), (3..5)] if index == 1
    return [(0..2), (6..8)] if index == 2
  elsif location == :row3 || location == :row4 || location == :row5
    return [(3..5), (0..2)] if index == 0
    return [(3..5), (3..5)] if index == 1
    return [(3..5), (6..8)] if index == 2
  elsif location == :row6 || location == :row7 || location == :row8
    return [(6..8), (0..2)] if index == 0
    return [(6..8), (3..5)] if index == 1
    return [(6..8), (6..8)] if index == 2
  end

  if location == :col0 || location == :col1 || location == :col2
    return [(0..2), (0..2)] if index == 0
    return [(3..5), (0..2)] if index == 1
    return [(6..8), (0..2)] if index == 2
  elsif location == :col3 || location == :col4 || location == :col5
    return [(0..2), (3..5)] if index == 0
    return [(3..5), (3..5)] if index == 1
    return [(6..8), (3..5)] if index == 2
  elsif location == :col6 || location == :col7 || location == :col8
    return [(0..2), (6..8)] if index == 0
    return [(3..5), (6..8)] if index == 1
    return [(6..8), (6..8)] if index == 2
  end
end

def split_array(array, rows, columns)
  thirds = []
  temp = []

  rows.each do |row|
    i = 0
    columns.each do |column|
      temp << array[row][column]
      i += 1
      if i == 3
        thirds << temp
        temp = []
        i = 0 
      end
    end
  end
  thirds
end

def get_values(third)
  values = []
  third.each do |t|
    v = []
    t.each do |element|
      v << element if element.is_a?(Array)
    end
    v = v.flatten.uniq
    values << v
  end
  values
end

def exist_only?(array, rows, columns, location)
  thirds = split_array(array, rows, columns)
  values = get_values(thirds)
  values_flat = values.flatten.uniq

  values_flat.each do |value|
    tally = 0
    index = nil
    values.each_with_index do |val, ind|
      if val.include?(value)
        tally += 1 
        index = ind
      end
    end

    if tally == 1 
      third_with_value = thirds[index]
      target = box_affected(location, index)
      clear_box(array, target[0], target[1], third_with_value, value, index, location)

    end
  end
end
