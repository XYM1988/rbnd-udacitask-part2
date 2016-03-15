module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(25)
  end
  def format_date
    dates = @start_date.strftime("%D") if @start_date
    dates << " -- " + @end_date.strftime("%D") if @end_date
    dates = "N/A" if !dates
    return dates
  end
  def format_date
    @due ? @due.strftime("%D") : "No due date"
  end
  def format_date(end_date, start_date = nil)
    if end_date == nil && start_date == nil
      return "N/A"
    elsif end_date != nil && start_date == nil
      dates = end_date.strftime("%D")
      return dates
    elsif end_date != nil && start_date != nil
      dates = start_date.strftime("%D")
      dates << " -- " + end_date.strftime("%D")
      return dates
    elsif end_date == nil && start_date != nil
      dates = start_date.strftime("%D")
      return dates
    end
  
  end
end
