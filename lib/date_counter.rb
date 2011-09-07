module DateCounter
   def count_date date
      if date.eql? 'today'
         DateTime.now - 1.day
      elsif date.eql? 'week'
         DateTime.now - 1.week
      else
         DateTime.now - 1.month
      end
   end
   module_function :count_date
end
