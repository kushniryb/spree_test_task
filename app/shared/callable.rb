class Callable
  def self.call(*args)
    new(*args).call do |value|
      yield value if block_given?
    end
  end
end
