require 'colorize'
require 'chronic'
module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(25)
  end
  
  def format_priority(priority)
    value = " ⇧".colorize(:blue) if priority == "high"
    value = " ⇨".colorize(:yellow) if priority == "medium"
    value = " ⇩".colorize(:green) if priority == "low"
    value = "" if !priority
    return value
  end
  
  # def format_date
  #   @due ? @due.strftime("%D") : "No due date"
  # end
  
  # def format_date
  #   dates = @start_date.strftime("%D") if @start_date
  #   dates << " -- " + @end_date.strftime("%D") if @end_date
  #   dates = "N/A" if !dates
  #   return dates
  # end
  
  def format_date(end_date, start_date=nil)
    if end_date == nil && start_date == nil
      return "N/A"
    elsif end_date != nil && start_date == nil
      return end_date.strftime("%m/%d/%Y")
    elsif end_date == nil && start_date != nil
      dates = start_date.strftime("%m/%d/%Y")
      return dates
    else
      dates = start_date.strftime("%m/%d/%Y")
      dates << " -- " + end_date.strftime("%m/%d/%Y")
      return dates
    end
  end
end
