module Enumerable
  # Your code goes here
  def my_each_with_index
    if block_given?
      i = 0
      until i == self.length do
        yield(self[i], i)
        i += 1
      end
    end
    self
  end

  def my_select
    if block_given?
      new_array = []
      my_each { |i| new_array << i if yield(i)}
      new_array
    else
      self
    end
  end

  def my_all?
    if block_given?
      result = true
      my_each { |i| result = false if yield(i) == false }
      result
    else
      self
    end
  end

  def my_any?
    if block_given?
      result = false
      my_each { |i| result = true if yield(i) }
      result
    else
      self
    end
  end

  def my_none?
    if block_given?
      result = true
      my_each { |i| result = false if yield(i) }
      result
    else
      self
    end
  end

  def my_count
    if block_given?
      counter = 0
      my_each { |i| counter += 1 if yield(i) }
      counter
    else
      self
    end
  end

  def my_map
    if block_given?
      map_array = []
      my_each { |i| map_array << yield(i) }
      map_array
    else
      self
    end
  end

  def my_inject(accumulator = 0)
    if block_given?
      base = accumulator
      i = 0
      until i == self.length do
        base = yield(base, self[i])
        i += 1
      end
      base
    else
      self
    end
  end


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  
  def my_each
    if block_given?
      i = 0
      until i == self.length do
        yield(self[i])
        i += 1
      end
    end
    self
  end

end