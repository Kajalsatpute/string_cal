# string_calculator.rb
require 'byebug'

class StringCalculator
  def get_input
    @n = []
    puts 'Enter numbers separated by commas'
    @n << gets.chomp
  end

  def return_result
    sum_arr = []
    @n.each do |numbers|
      @arr = numbers.gsub('"','').gsub('"','').scan(/\d+(?:,\d+)*/)
    end
    @arr.each do |num|
      begin
        byebug
        sum_arr << StringCalculator.add(num)
        puts "Sum of the numbers: #{sum_arr}"
      rescue StandardError => e
        puts "Error: #{e.message}"
      end
    end
  end

  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = find_delimiter(numbers)
    numbers = extract_numbers(numbers, delimiter)

    validate_numbers(numbers)

    numbers.sum
  end

  private

  def self.find_delimiter(numbers)
    delimiter_match = numbers.match(/^\/\/(.+)\n/)
    delimiter_match ? Regexp.escape(delimiter_match[1]) : ',|\n'
  end

  def self.extract_numbers(numbers, delimiter)
    numbers.split(/#{delimiter}/).map(&:to_i)
  end

  def self.validate_numbers(numbers)
    negative_numbers = numbers.select { |n| n.negative? }

    raise "Negative numbers not allowed: #{negative_numbers.join(', ')}" if negative_numbers.any?
  end
end

sc = StringCalculator.new()
sc.get_input
sc.return_result
