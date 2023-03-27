# Replicating the most common enums.
module Enumerable
  def my_each_with_index
    i = 0
    each do |item|
      yield(item, i)
      i += 1
    end
  end

  def my_select
    filtered = []
    each do |item|
      filtered << item if yield(item)
    end
    filtered
  end

  def my_all?
    all = true
    each do |item|
      unless yield(item)
        all = false
        break
      end
    end
    all
  end

  def my_any?
    any = false
    each do |item|
      if yield(item)
        any = true
        break
      end
    end
    any
  end

  def my_none?
    none = true
    each do |item|
      if yield(item)
        none = false
        break
      end
    end
    none
  end

  def my_count
    count = 0
    if block_given?
      each do |item|
        count += 1 if yield(item)
      end
    else
      each do
        count += 1
      end
    end
    count
  end

  def my_map
    arr = []
    each do |item|
      arr << yield(item)
    end
    arr
  end

  def my_inject(accum = 0)
    each do |item|
      accum = yield(accum, item)
    end
    accum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each(&block)
    each do |item|
      block.call(item)
    end
  end
end
