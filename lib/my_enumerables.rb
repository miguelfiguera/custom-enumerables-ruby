module Enumerable
def my_each_with_index
  i=0
  while i < self.length
    yield self[i],i
    i += 1
  end
  self
end

  def my_all?
    concidence = 0
    self.my_each do |item|
      if block_given?
        concidence += 1 if yield item
      elsif item != nil && item != false
        concidence += 1
      end
    end
    return true if concidence == self.length
    return false if concidence != self.length
  end

  def my_inject(argument = 0)
    self.my_each do |n|
			argument = (yield argument, n)
		end
		argument
  end

	def my_map(&proc) #this is how you call a proc on the argument
		answer = []
		if proc
			self.my_each { |n| answer << proc.call(n) }
			answer
		elsif block_given?
			self.my_each { |n| answer << (yield n) }
		end
		answer
	end

  def my_select
    answer = []
    self.each do |x|
      if block_given?
        answer.push(x) if yield x
      end
    end
    answer
  end

  def my_count
    count = 0 if block_given?
    count = self.length unless block_given?
    self.each do |n|
      if block_given?
        count += 1 if yield n
      end
    end
    count
  end

  def my_any?
    concidence = 0
    self.my_each do |item|
      if block_given?
        concidence += 1 if yield item
      elsif item != nil && item != false
        concidence += 1
      end
    end
    return true if concidence != 0
    return false if concidence == 0
  end 

  def my_none?
    concidence = 0
    self.my_each do |item|
      if block_given?
        concidence += 1 if yield item
      elsif item != nil && item != false
        concidence += 1
      end
    end
    return false if concidence != 0
    return true if concidence == 0
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end
end
