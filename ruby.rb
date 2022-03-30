  
array = [1,2,3,4,5,6,7,8,9,10]
  
def my_each(array)
    i = 0
    until i == array.length do
      yield(array[i])
      i += 1
    end
end

my_each(array) { |i| puts i * 2}
my_each(array)

  def my_each_with_index
    i = 0
    until i == self.length do
      yield(self[i], i)
      i += 1
    end
  end
  
# Calls the block, if given, with each element of self; returns a new Array containing
# those elements of self for which the block returns a truthy value:
  def my_select
    array = []
    i = 0
    until i == self.length do
      array << self[i] if yield(self[i])
      i += 1
    end
    print array
  end
  



def my_select(array)
  new_array = []
  i = 0
  until i == array.length do
    new_array << array[i] if yield(array[i])
    i += 1
  end
  print new_array
end

my_select(array) { |i| i > 2 }
print array.select { |i| i > 2 }

def my_all(array)
  result = true
  i = 0
  until i == array.length do
    result = false if yield(array[i]) == false
    i += 1
  end
  puts result
end

my_all(array) { |i| i < 100 }
puts array.all? { |i| i < 100 }

def my_any(array)
  result = false
  i = 0
  until i == array.length do
    result = true if yield(array[i])
    i += 1
  end
  puts result
end

puts array.any? { |i| i > 100 }
my_any(array) { |i| i > 100 }

def my_none(array)
  result = true
  i = 0
  until i == array.length do
    result = false if yield(array[i])
    i += 1
  end
  puts result
end

puts array.none? { |i| i > 7 }
my_none(array) { |i| i > 7 }

def my_count(array)
  counter = 0
  i = 0
  until i == array.length do
    counter += 1 if yield(array[i])
    i += 1
  end
  puts counter
end

puts array.count { |i| i > 5 }
my_count(array) { |i| i > 5 }

def my_map(array)
  map_array = []
  i = 0
  until i == array.length do
    map_array << yield(array[i])
    i += 1
  end
  print map_array
end

print array.map { |i| i.odd? }
my_map(array) { |i| i.odd? }

def my_inject(array)
  i = 0
  base = 0
  until i == array.length do
    base += yield(base, array[i])
    i += 1
  end
  puts base
end

puts array.inject {|base, number| base + number }
my_inject(array) { |base, number| base + number }