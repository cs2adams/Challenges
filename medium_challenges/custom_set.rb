require 'pry'
require 'pry-byebug'

class CustomSet
  def initialize(data = [])
    @data = []
    data.each { |datum| add(datum) }
  end

  def add(datum)
    @data << datum unless @data.include?(datum)
    self
  end

  def empty?
    @data.empty?
  end

  def contains?(datum)
    @data.include?(datum)
  end

  def subset?(other_set)
    @data.all? { |datum| other_set.contains?(datum) }
  end

  def disjoint?(other_set)
    @data.none? { |datum| other_set.contains?(datum) }
  end

  def intersection(other_set)
    @data.each_with_object(CustomSet.new) do |datum, new_set|
      new_set.add(datum) if other_set.contains?(datum)
    end
  end

  def difference(other_set)
    @data.each_with_object(CustomSet.new) do |datum, new_set|
      new_set.add(datum) unless other_set.contains?(datum)
    end
  end

  def union(other_set)
    new_set = CustomSet.new
    @data.each { |datum| new_set.add(datum) }
    other_set.data.each { |datum| new_set.add(datum) }
    new_set
  end

  def ==(other_set)
    subset?(other_set) && other_set.subset?(self)
  end

  alias eql? ==

  protected

  attr_reader :data
end
