class FindElements
  def self.find_elements_for_number(list, number)
    contains_non_numeric = list.select { |e| !e.is_a? Numeric }
    if !contains_non_numeric.empty? or list.size < 3
      raise "Input array contains non numeric values: #{contains_non_numeric}"
    end

    #For trivial search
    sum_of_input_values = list.inject(0, :+)
    if list.size == 3 and sum_of_input_values == number
      return list
    end

    list_size = list.size - 1
    0.upto(list_size) do |i|
      (i + 1).upto(list_size) do |j|
        (j + 1).upto(list_size) do |k|
          result_list = [list[i], list[j], list[k]]
          sum = result_list.inject(0, :+)
          if sum == number
            return result_list
          end
        end
      end
    end
    return nil
  end
end

puts FindElements.find_elements_for_number([0.5,0.5,1,62,26,2,6], 8.5)
