require 'Qt4'
require 'customDate.rb'

class CustomSearch < Qt::Dialog
slots 'getFirstDate()','getLastDate()','ok()','cancel()'
def initialize
super
setGeometry(300,250,250,150)
setWindowTitle("Select Start, End Dates")
@lineFirstDate = Qt::LineEdit.new(self)
@lineFirstDate.setReadOnly(true)
@lineFirstDate.setGeometry(25,20,100,25)
@buttonFirstDate = Qt::PushButton.new(self)
@buttonFirstDate.setText("Start Date")
@buttonFirstDate.setGeometry(140,22,80,20)

@lineSecDate = Qt::LineEdit.new(self)
@lineSecDate.setReadOnly(true)
@date = Qt::Date.new
#@lineSecDate.setText(@date::currentDate.toString("yyyy-MM-dd"))
@lineSecDate.setGeometry(25,60,100,25)
@buttonSecDate = Qt::PushButton.new(self)
@buttonSecDate.setText("End Date")
@buttonSecDate.setGeometry(140,62,80,20)

@buttonOk = Qt::PushButton.new(self)
@buttonOk.setText("Ok")
@buttonOk.setGeometry(30,110,80,25)

@buttonCancel = Qt::PushButton.new(self)
@buttonCancel.setText("Cancel")
@buttonCancel.setGeometry(130,110,80,25)

@fDate = Qt::Date.new
@lDate = Qt::Date.new

connect(@buttonFirstDate,SIGNAL('clicked()'),self,SLOT('getFirstDate()'))
connect(@buttonSecDate,SIGNAL('clicked()'),self,SLOT('getLastDate()'))
connect(@buttonOk,SIGNAL('clicked()'),self,SLOT('ok()'))
connect(@buttonCancel,SIGNAL('clicked()'),self,SLOT('cancel()'))
end

def getFirstDate()
date = Datee.new
date.exec
@fDate = date.gettDate()
@lineFirstDate.setText(@fDate)
end

def getLastDate()
date = Datee.new
date.exec
@lDate = date.gettDate()
@lineSecDate.setText(@lDate)
end

def ok()
if((@lineFirstDate.text!=""&&@lineFirstDate.text!=nil)&&(@lineSecDate.text!=""&&@lineSecDate.text!=nil))
self.close
else
end
end

def cancel()
@lineFirstDate.setText("")
@lineSecDate.setText("")
self.close
end

def getFDate()
return @fDate
end

def getLDate()
return @lDate
end

def closeEvent(event)
puts "i am in closing"
if((@lineFirstDate.text!=""||@lineFirstDate.text!=nil)&&(@lineSecDate.text!=""||@lineSecDate.text!=nil))
return 0
else
return 1
end
end

end
