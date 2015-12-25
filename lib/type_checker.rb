module TypeChecker
  def self.integer?(var)
    return false if var.nil?
    var.is_a? Integer
  end
end
