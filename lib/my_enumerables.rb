module Enumerable
  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    selected = []
    self.my_each do |i|
      if yield(i)
        selected.push(i)
      end
    end
    selected
  end

  def my_all?
    self.my_each do |i|
      return false unless yield(i)
    end
    true
  end

  def my_any?
    self.my_each do |i|
      return true if yield(i)
    end
    false
  end

  def my_none?
    self.my_each do |i|
      return false if yield(i)
    end
    true
  end

  def my_count(item = nil)
    count = 0
    if item != nil
      self.my_each do |i|
        count += 1 if i == item
      end
    elsif block_given?
      self.my_each do |i|
        count += 1 if yield(i)
      end
    else
      count = self.length
    end
    count
  end

  def my_map
    mapped = []
    self.my_each do |i|
      mapped.push(yield(i))
    end
    mapped
  end

  def my_inject(acc)
    self.my_each do |i|
      acc = yield(acc, i)
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
end
