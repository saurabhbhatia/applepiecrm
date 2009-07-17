require 'Qt4'
require 'dbase.rb'

class SystemsStatus < Qt::Dialog
slots 'startSession()','closeSession()','addTime()','addSales()'
def initialize(parent=nil)
super(parent)

setGeometry(100,50,900,600)
setWindowTitle("System's Status")
@titleLabel = Qt::Label.new(self)
 @titleLabel.setObjectName("Heading")
 @titleLabel.setGeometry(Qt::Rect.new(180,10,700,100))
 @titleLabel.setText("Internet Cafe Customer Management System<br>System's Status")
 @titleLabel.setAlignment(Qt::AlignCenter)
 @titleLabel.setFont(Qt::Font.new("Verdana",20,Qt::Font::Bold))

@tab = Qt::TableWidget.new(self)
# Disabling Edit Triggers of Qt::TableWidget
@tab.setEditTriggers(Qt::AbstractItemView::NoEditTriggers)
@tab.setGeometry(50,100,750,650)
@tab.setColumnCount(7)
@tab.setHorizontalHeaderItem(0,Qt::TableWidgetItem.new("System Number",1))
@tab.setHorizontalHeaderItem(1,Qt::TableWidgetItem.new("Customer ID",1))
@tab.setHorizontalHeaderItem(2,Qt::TableWidgetItem.new("Customer Name",1))
@tab.setHorizontalHeaderItem(3,Qt::TableWidgetItem.new("Login Time",1))
@tab.setHorizontalHeaderItem(4,Qt::TableWidgetItem.new("Closing Time",1))
@tab.setHorizontalHeaderItem(5,Qt::TableWidgetItem.new("Sales",1))
@tab.setHorizontalHeaderItem(6,Qt::TableWidgetItem.new("Totla Amount",1))

@date = Qt::Date.new
@date = @date.currentDate
puts "####"
puts @date.currentDate.toString
puts "$$$$"
#puts @date.currentDate.to_String
@base = Dbase.new
if(@base.conn)
puts "i am at Dbase"
@qry = Qt::SqlQuery.new(@base)
@qry = @base.getSystems()
while(@qry.next)
@tab.setRowCount(@tab.rowCount+1)
@tab.setItem(@tab.rowCount-1,0,Qt::TableWidgetItem.new(@qry.value(0).toString,1))
end
end
@menubar = Qt::MenuBar.new(self)
 @menubar.setObjectName('menubar')
 @menubar.setFont(Qt::Font.new('verdana',13))

@menuActions = Qt::Menu.new(@menubar)
 @menuActions.setObjectName('menuActions')
 @menuActions.setTitle('&Actions')
 @menuActions.setFont(Qt::Font.new('verdana',10))

@actionStartSession = Qt::Action.new(self)
 @actionStartSession.setObjectName("actionStartSession")
 @actionStartSession.setText("Start Session")
 @actionStartSession.setShortcut("Ctrl+s")

@actionCloseSession = Qt::Action.new(self)
 @actionCloseSession.setObjectName("actionCloseSession")
 @actionCloseSession.setText("Close Session")
 @actionCloseSession.setShortcut("Ctrl+C")

#@actionAddTime = Qt::Action.new(self)
 #@actionAddTime.setObjectName('actionAddTime')
 #@actionAddTime.setText('Add Time')
 #@actionAddTime.setShortcut('Ctrl+T')

#@actionAddSales = Qt::Action.new(self)
 #@actionAddSales.setObjectName('actionAddSales')
 #@actionAddSales.setText("Add Sales")
 #@actionAddSales.setShortcut("Ctrl+A")


@menubar.addAction(@menuActions.menuAction())
@menuActions.addAction(@actionStartSession)
@menuActions.addAction(@actionCloseSession)
#@menuActions.addSeparator
#@menuActions.addAction(@actionAddTime)
#@menuActions.addAction(@actionAddSales)

connect(@actionStartSession,SIGNAL('triggered()'),self,SLOT('startSession()'))
connect(@actionCloseSession,SIGNAL('triggered()'),self,SLOT('closeSession()'))
#connect(@actionAddTime,SIGNAL('triggered()'),self,SLOT('addTime()'))
#connect(@actionAddSales,SIGNAL('triggered()'),self,SLOT('addSales()'))
end

def startSession()
puts "Starting New Session"
@ok = Qt::Boolean.new
@text = Qt::LineEdit::Normal
@cID = Qt::InputDialog::getText(self,"Input Customer ID","Enter Customer ID",Qt::LineEdit::Normal,"",@ok)
puts @cID
if (@cID != "" && @cID != nil)
@base = Dbase.new
if(@base.conn)
@qry = Qt::SqlQuery.new(@base)
@qry = @base.getById(@cID.to_s)
#puts @qry.size
if @qry!=nil
@ok = Qt::Boolean.new
@text = Qt::LineEdit.new
@text.setText("15")
@cID = 0
@cID = Qt::InputDialog::getText(self,"Time Required","Enter How Much Time in Mins:",Qt::LineEdit::Normal,"",@ok)
if@cID !=nil&&@cID!=""
puts "@@@"
puts @ok.to_s
puts "###"
while(@qry.next)
#@tab.setRowCount(@tab.rowCount+1)
cid = @qry.value(0).toString
name = @qry.value(1).toString
@tab.setItem(@tab.currentRow,1,Qt::TableWidgetItem.new(cid,1))
@tab.setItem(@tab.currentRow,2,Qt::TableWidgetItem.new(name,1))
time = Qt::Time::currentTime
text_time = time.toString("hh:mm")
puts text_time[2]
puts time.hour
puts @date.toString("dd.MM.yy")
puts "!!!!!"
@tab.setItem(@tab.currentRow,3,Qt::TableWidgetItem.new(time.toString,1))
@payment = @cID.to_i
puts @payment
@tab.setItem(@tab.currentRow,4,Qt::TableWidgetItem.new(time.addSecs(60*@cID.to_i).toString,1))
@total = getAmount
system = @tab.item(@tab.currentRow,0)
@tab.setItem(@tab.currentRow,6,Qt::TableWidgetItem.new(@total.to_s,1))
puts system.text
@base.newUser(cid,name,@date.toString("yyyy-MM-dd"),time.toString("hh:mm"),@tab.item(@tab.currentRow,0).text,"A")
@tab.clearSelection
end
end
else
Qt::MessageBox::critical(self,"Message" , "Please Enter Correct ID" )
startSession()
end
end
end
end

def closeSession()
puts "Closing Session"
id = @tab.item(@tab.currentRow,1).text
@base = Dbase.new
if(@base.conn)
@qry = Qt::SqlQuery.new(@base)
@qry = @base.getSno(id)
@qry.next
sno = @qry.value(0).toString
puts "(((())))"
puts sno
puts @tab.item(@tab.currentRow,1).text
name = @tab.item(@tab.currentRow,2).text
puts name
date = @date.toString("yyyy-MM-dd")
puts date
time = @tab.item(@tab.currentRow,3).text
puts time
system = @tab.item(@tab.currentRow,0).text
puts system
@tab.setItem(@tab.currentRow,1,Qt::TableWidgetItem.new("",1))
@tab.setItem(@tab.currentRow,2,Qt::TableWidgetItem.new("",1))
@tab.setItem(@tab.currentRow,3,Qt::TableWidgetItem.new("",1))
@tab.setItem(@tab.currentRow,4,Qt::TableWidgetItem.new("",1))
if id!=""||id!=nil
@base.closeSession(sno,id,name,date,time,system)
end
end
#@tab.removeRow(@tab.currentRow)
end

def addTime()
puts "Adding Time"
end

def addSales()
puts "Add Sales"
end

def closeEvent(event)
puts "closing"
end

def getAmount()
if @payment<=15
@payments = 5
puts @payments
elsif @payment<=30 && @payment>15
@payments = 7
puts "payment"
puts @payments
elsif @payment>=60
hrs = @payment/60
puts hrs
mins = @payment%60
puts mins
@payments = hrs*10
if mins<=15 && mins>0
@payments = @payments+5
elsif mins<=30 && mins >15
@payments = @payments+7
end
puts "final payment"
puts @payments
return @payments
end
end
end
