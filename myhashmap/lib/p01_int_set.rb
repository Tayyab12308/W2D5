require "byebug"
class MaxIntSet

  attr_accessor :store
  
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
   raise "Out of bounds" if num < 0 || num > @store.length
    @store[num] = true 
    @store[num]
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true 
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet

  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    @store[num].delete(num)
    nil
  end

  def include?(num)
    self[num].include?(num) if !self[num].nil? 
  end

  private

  def [](num) 
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      resize! if @store.length <= count
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    @count -= 1 if self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num) if !self[num].nil?
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # debugger
    new_length = @store.length * 2
    old_arr = @store
    @store = Array.new(new_length) { Array.new }
    old_arr.each do |bucket|
      bucket.each { |el| @store[el % @store.length] << el }
    end
    @store
  end

end
