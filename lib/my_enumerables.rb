module Enumerable
  # Your code goes here
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
