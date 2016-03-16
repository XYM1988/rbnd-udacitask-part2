require 'chronic'
class TodoItem
  include Listable, UdaciListErrors
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    if @priority != "low" && @priority != "medium" && @priority != "high" && @priority != "" && @priority != nil
      raise UdaciListErrors::InvalidPriorityValue, "!!!!!!Wrong Priority!!!!!!"
    end
  end



  def details
    format_description(@description) + "due: " +
    format_date(@due) +
    format_priority(@priority)
  end
end
