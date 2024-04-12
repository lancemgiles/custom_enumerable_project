# frozen_string_literal: true

# Building enumerable methods from scratch
module Enumerable

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self do
      yield(item)
    end
  end
end

arr = [1, 2, 3, 4, 5, 6]
arr.my_each { |x| puts "#{x + x}" }
