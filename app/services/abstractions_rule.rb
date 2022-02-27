class AbstractionsRule
  def initialize(badge, result)
    @badge=badge
    @result=result
  end

  def satisfies?
    raise "#{__method__} doesn't work witn thos #{self.class}"
  end
end
