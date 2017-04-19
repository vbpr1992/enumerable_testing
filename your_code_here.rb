class ReimplementEnumerable
  def initialize(collection)
    @collection = collection
  end

  def select
    result = []

    @collection.each do |element|
      should_select = yield(element)
      if should_select
        result << element
      end
    end

    return result
  end

  # The rest of the code for all the enumerables
  # you must write go here
  def all?
    result = []

    @collection.each do |element|
      show_all = yield(element)
      if show_all
        result << element
      end
    end
    result == @collection
  end

  def count
    count = 0

    @collection.each do |element|
      show_count = yield(element)
      if show_count
        count += 1
      end
    end
    return count
  end

  def find

    @collection.each do |element|
      show_find = yield(element)
      if show_find
        return element
      end
    end
    return nil
  end

  def each_with_index
    index = 0
    @collection.each do |element|
      yield(element, index)
      index += 1
    end
  end

  def drop(index)
    new_index = 0
    new_list = []

    @collection.each do |element|
      if new_index >= index
        new_list << element
      end
      new_index += 1
    end
    return new_list
  end

  def drop_while
    new_array = []

    @collection.each do |element|
      dropped_item = yield(element)
      if dropped_item
        new_array << element
      end
    end
    new_array
  end

  def find_index
    list = 0

    @collection.each do |element|
      if yield(element)
        return list
      end
      list += 1
    end
  end
end
