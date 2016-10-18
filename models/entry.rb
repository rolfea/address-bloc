require_relative '../../bloc-record/lib/bloc_record/base.rb'

class Entry < BlocRecord::Base

  def to_s
    "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
  end

  def self.method_missing(method, *args, &block)
    value_and_parameter = ""
    value = ""
    parameter = ""
    # turn the method symbol into a string
    method_name = method.to_s
    # pulls of material after "find_by"
    method_name.match(/^find_by_(.*)$/) { |match| value_and_parameter = match }
    # sets into separate variables
    value_and_parameter.match(/^\w*/) { |match| value = match }
    value_and_parameter.match(/"(\w*)/) { |match| parameter = match }
    # set anything pulled off after by_ it to variables
    # Entry.find_by(:value, parameter)
  end
end
