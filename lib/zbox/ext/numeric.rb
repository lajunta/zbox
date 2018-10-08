class Numeric
  class<<self
   def percentage_of(divnum)
     sprintf("%0.0f",self.to_f/divnum.to_f*100)+"%"
   end
  end
end
