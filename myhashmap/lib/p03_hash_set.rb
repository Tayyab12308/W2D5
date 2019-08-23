class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless self.include?(key)
      resize! if @store.length <= self.count
      self[key] << key
      @count += 1
      return true
    end
    false
  end

  def include?(key)
    self[key].include?(key) unless self[key].nil?
  end

  def remove(key)
    if self[key].include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % @store.length] 
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
