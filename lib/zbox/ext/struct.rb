class Struct                                                                                                                                            
  class<<self
    def to_hash
       Hash[*members.zip(values).flatten]
    end
  end
end
