require 'bloc_record/base'

class Entry < BlocRecord::Base

  def to_s
    "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
  end

  def method_missing(method, *args, &block)
    
  end
end
