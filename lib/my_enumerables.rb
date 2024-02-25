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

      if selected.empty?
        nil
      else
        selected
      end
    elsif is_a? Hash
      selected = {}
    end
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
      i += 1
    end

    self
  end
end

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

a = { one: 1, two: 2, three: 3 }
p a.my_each { |k, v| p "#{k}: #{v}" }

