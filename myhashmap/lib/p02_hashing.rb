class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |ele, i|
      sum += i.hash * ele.hash
    end
    sum
  end
end

class String
  def hash
    sum = 0
    self.each_char.with_index do |ele, i|
      sum += ele.ord.hash * (i + 1)
    end
    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    keys = self.keys
    values = self.values
    (0...keys.length).each do |i|
      sum += keys[i].hash * values[i].hash
    end
    sum
  end
end
