require 'Qt4'
require 'iccms_main_menu.rb'
if $0 == __FILE__
a = Qt::Application.new(ARGV)
w = MainMenu.new
w.showMaximized
a.exec
end
