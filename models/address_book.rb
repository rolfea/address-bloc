require_relative 'entry'
require "csv"
require 'bloc_record/base'
require 'sqlite3'

class AddressBook < BlocRecord::Base
  attr_reader :entries

  def add_entry(name, phone_number, email)
    Entry.create(name: name, phone_number: phone, email: email)
  end

  def import_from_csv(file_name)
    # executes bloc of each row of the provided csv
    CSV.foreach(file_name) do |row|
      connection.execute <<-SQL
        INSERT INTO #{table} (#{attributes.join(",")})
        VALUES (#{row.join(",")});
      SQL
    end

    # original implementation
    # csv_text = File.read(file_name)
    # csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    # csv.each do |row|
    #   row_hash = row.to_hash
    #   add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    # end
  end
end
