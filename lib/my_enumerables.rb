module Enumerable
  def my_each_with_index
    e = 0
    while e < self.length
      yield(self[e], e)
      e += 1
    end
    self
  end

  def my_select
    values = []
    self.my_each do |element|
      if(yield(element) == true)
        values << element
      end
    end
    values
  end

  def my_all?
    self.my_each do |element|
      if(yield(element) == false)
        return false 
      end
    end
    return true
  end

  def my_none?
    self.my_each do |element|
      if(yield(element) == false)
        return true
      else 
        return false
      end
    end
  end

  def my_count
    count = 0
    if block_given?
      self.my_each do |element|
        count += 1 if yield(element)
      end
    else
      self.my_each do |_element|
        count += 1
      end
    end
    count
  end
  
  def my_map
    result = []
    if block_given?
      self.my_each do |element|
        result << yield(element)
      end
    end
    return result
  end

  def my_inject(init)
    acc = init
    self.my_each do |element|
      acc = yield(acc, element)
    end
    return acc
  end
end



# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end

  
end
