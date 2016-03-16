require 'artii'

class UdaciList
  include UdaciListErrors
  attr_reader :title, :items

  def initialize(options={})
    artii = Artii::Base.new :font => 'slant'
    if options[:title] == nil
      @title = artii.asciify("Untitled List")
    else
      @title = artii.asciify(options[:title])
    end
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    if type != "todo" && type != "event" && type != "link"
      raise UdaciListErrors::InvalidItemType, "!!!!!!Wrong Type!!!!!!"
    end
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
  end
  def delete(index)
    if index > @items.length
      raise UdaciListErrors::IndexExceedsListSize, "!!!!!!Exceeds List Size!!!!!!"
    end
    @items.delete_at(index - 1)
  end
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
