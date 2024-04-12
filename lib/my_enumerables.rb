# frozen_string_literal: true

# Building enumerable methods from scratch
module Enumerable
  def my_each_with_index
    i = 0
    while i < size
      my_each do |item|
        yield(item, i)
        i += 1
      end
    end
    self
  end

  def my_select
    selected = []
    i = 0
    while i < size
      selected << self[i] if yield(self[i])
      i += 1
    end
    selected
  end
end

class Array
  def my_each
    for item in self do
      yield(item)
    end
  end
end

arr = [1, 2, 3]
p (arr.my_select {|x| x.even?})
puts 'the real one'
p (arr.select { |x| x.even? })
