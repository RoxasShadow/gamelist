class Array

  def to_date(fill = ?*)
    if self.length == 1
      self[2] = self[0]
      self[0] = fill * 2
      self[1] = fill * 7
    elsif self.length == 2
      tmp = self[1]
      self[1] = self[0]
      self[2] = tmp
      self[0] = fill * 2
    end
    
    self
  end
  
  def to_params(symbol = ?_)
    params = []
    
    self.each { |p|
      if p[0] == symbol
        params << { :value => p[1..-1], :neg => true  }
      else
        params << { :value => p,        :neg => false }
      end
    }
    
    params
  end
  
end

class Numeric

  def to_bool
    !self.zero?
  end
  
  def to_dec
    self.to_s + (self < 10 ? ' ' : '')
  end
  
end

class String

  def start_with_letter? # Not used, actually
    [*(?a..?z), *(?A..?Z)].include? self[0]
  end
  
end
