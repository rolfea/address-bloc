require 'bloc_record/base'

class Entry < BlocRecord::Base

  def to_s
    "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
  end

  def self.method_missing(method, *args, &block)
    # turn the method symbol into a string
    method.to_s
    # regex to pull anything after find_by_ off
    # set anything pulled off of it to variables
    Entry.find_by(:var, var)
  end
end
