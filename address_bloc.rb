require_relative 'controllers/menu_controller'
require_relative '../bloc-record/lib/bloc_record.rb'

BlocRecord.connect_to("db/address_bloc.sqlite")

menu = MenuController.new
system "clear"
puts "Welcome to AddressBloc!"
menu.main_menu
