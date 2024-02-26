# frozen_string_literal: true

module Enumerable
  # Your code goes here
  def my_each_with_index
    loop_times = length
    index = 0

    while index < loop_times
      yield(self[index], index)
      index += 1
    end

    self
  end

  def my_select
    if is_a? Array
      selected = []
      my_each do |n|
        selected.push(n) if yield n
      end
    elsif is_a? Hash
      selected = {}
      my_each do |key, value|
        selected[key] = value if yield(key, value)
      end
    end

    selected
  end

  def my_all?
    test = []
    my_each do |n|
      test << yield(n)
    end
    return false if test.uniq.length > 1

    test.uniq[0]
  end

  def my_any?
    test = false
    my_each do |n|
      test = true if yield(n)
    end
    test
  end

  def my_none?
    test = true
    my_each do |n|
      test = false if yield(n)
    end
    test
  end

  def my_count
    if block_given?
      truthy = []
      my_each { |n| truthy << true if yield(n) }
      truthy.length
    else
      length
    end
  end

  def my_map
    mapped = []
    my_each { |n| mapped << yield(n) }
    mapped
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    loop_times = length
    i = 0

    while i < loop_times
      yield self[i]
      i += 1 end

    self
  end
end

# extending Hash
class Hash
  def my_each
    loop_times = length
    keys = self.keys
    values = self.values
    i = 0

    while i < loop_times
      yield(keys[i], values[i])
      i += 1
    end

    self
  end
end

