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

  def my_all?
    checked = []
    my_each do |item|
      checked.push(item) if yield(item)
    end
    checked == self
  end

  def my_any?
    checked = []
    my_each do |item|
      checked.push(item) if yield(item)
    end
    checked.length > 1
  end

  def my_none?
    checked = []
    my_each do |item|
      checked.push(item) if yield(item)
    end
    checked == []
  end

  def my_count
    counter = 0
    my_each do |num|
      if block_given?
        counter += 1 if yield(num)
      else
        return length
      end
    end
    counter
  end

  def my_map
    mapped = []
    my_each do |item|
      mapped.push(yield(item))
    end
    mapped
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
p arr.my_count
puts 'the real one'
p arr.count
