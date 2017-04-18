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
    count
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
    @collection.each do |element|
      

    end

  end
end
