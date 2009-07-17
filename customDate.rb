require 'Qt4'

class Datee < Qt::Dialog
slots 'getDate()'
def initialize
super
setGeometry(300,250,255,180)
@calender = Qt::CalendarWidget.new(self)
connect(@calender,SIGNAL('selectionChanged()'),self,SLOT('getDate()'))
end

def getDate()
@date = @calender.selectedDate.toString('yyyy-MM-dd')
puts @date
end
def gettDate()
if (@date!=nil)
return @date
else
return Qt::Date::currentDate.toString("yyyy-MM-dd")
end
end
end

