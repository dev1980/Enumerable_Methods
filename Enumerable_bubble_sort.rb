module Enumerable
  def my_each
    for i in self
      yield i
    end
  end

  def my_each_with_index
    i = 0
    for j in self
      yield j, i
      i += 1
    end
  end

  def my_select(&block)
    arr = []
    my_each { |e| arr.push(e) if block.call(e) }
    arr
  end

  def my_all?(&block)
    result = true
    if block
      my_each { |e| result = false unless yield(e) }
    else
      my_each { |e| result = false unless e }
    end
      result
  end

  def my_any
    i = 0
    while i < self.length
      if yield(self[i])
        return true
      else
        i += 1
      end
    end
    if i == self.length
      return false
    end
  end

  def my_none
    i = 0
    while i < self.length
      if yield(self[i]) == false
        i += 1
      else
        return false
      end
    end
    if i == self.length
      return true
    end
  end

  def my_count(x = nil)
    i = 0
    if num
      result = []
        while i < self.length
          result << self[i] if i == x
          i += 1
        end
      return result
    else
        count = 0
        while i < self.length
          count += 1
          i += 1
        end
        return count
    end
  end

  def my_map(proc=nil)
    i = 0
    result = []
    if proc
        while i < self.length
          result << proc.call(self[i])
          i += 1
        end
        return result
    else
        while i < self.length
          result << yield(self[i])
          i += 1
        end   
    end
    return result
  end

  def my_inject(val = nil, &block)
    if instance_of? Range
      last = self.last
      first = self.first
      result = val
      i = first
    while i <= last
        result = block.call(result, i) unless i == first
        i += 1
    end
    else
      i = 1
      result = self[0]
      result = block.call(result, val) if val
    while i < length
      result = block.call(result, self[i])
      i += 1
    end
    end
    result
  end

 def multiply_els
    return self.my_inject {|x,y| x * y}
 end
end