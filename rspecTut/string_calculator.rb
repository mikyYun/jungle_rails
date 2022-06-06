class StringCalculator
  def self.add(input)
    if input.empty?
      0
    else
    # input.to_i
    # split input into an array
    numbers = input.split(",").map { |num| num.to_i }
    # add each element
    numbers.inject(0) { |sum, number| sum + number }
    end
  end
end