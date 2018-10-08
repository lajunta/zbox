# -*- encoding : utf-8 -*-
class Time
  def to_fmt1
   strftime("%Y-%m-%d %H:%M") 
  end

  def to_date1
	  year=self.year
	  month=self.month
	  day=self.day
    year.to_s+"年"+month.to_s+"月"+day.to_s+"日"
  end

  def to_date2
	  year=self.year
	  month=self.month
	  day=self.day
    year.to_s+"-"+month.to_s+"-"+day.to_s
  end
end
