require 'Qt4'
require 'dbase.rb'

class TodaysReport < Qt::Dialog
def initialize
super
# Providing Title for Report window
setWindowTitle("Today's Customers Report")
puts "busy with todays report"
@base = Qt::SqlDatabase.new
@base = Dbase.new
@date = Qt::Date.new
@date = @date.currentDate
if(@base.conn)
@qry = Qt::SqlQuery.new(@base)
@qry = @base.todaysReport(@date.toString("yyyy-MM-dd"))
@tab = Qt::TableWidget.new(self)
# Disabling Edit Triggers of Qt::TableWidget
@tab.setEditTriggers(Qt::AbstractItemView::NoEditTriggers)
@tab.setGeometry(10,20,980,650)
@tab.setRowCount(@qry.size)
@tab.setColumnCount(5)
@tab.setHorizontalHeaderItem(0,Qt::TableWidgetItem.new("Customer Id",1))
@tab.setHorizontalHeaderItem(1,Qt::TableWidgetItem.new("Customer Name",1))
@tab.setHorizontalHeaderItem(2,Qt::TableWidgetItem.new("Date",1))
@tab.setHorizontalHeaderItem(3,Qt::TableWidgetItem.new("Time",1))
@tab.setHorizontalHeaderItem(4,Qt::TableWidgetItem.new("System Number",1))
@row = 0
@col = 0
while(@qry.next)
puts "$$$$$"
@coll = 0
#val1 = @qry.value(0)
#val2 = @qry.value(1)
#puts val1.toString
#puts val2.toString
#@tab.setItem(@row,@col+@coll,Qt::TableWidgetItem.new(val1.toString,1))
#@coll = @coll+1
#@tab.setItem(@row,@col+@coll,Qt::TableWidgetItem.new(val2.toString,1))
#@coll = @coll+1
@tab.setItem(@row,@col+@coll,Qt::TableWidgetItem.new(@qry.value(@coll+1).toString,1))
@coll = @coll+1
@tab.setItem(@row,@col+@coll,Qt::TableWidgetItem.new(@qry.value(@coll+1).toString,1))
@coll = @coll+1
@tab.setItem(@row,@col+@coll,Qt::TableWidgetItem.new(@qry.value(@coll+1).toString,1))
@coll = @coll+1
@tab.setItem(@row,@col+@coll,Qt::TableWidgetItem.new(@qry.value(@coll+1).toString,1))
puts @qry.lastError.text
@coll = @coll+1
@tab.setItem(@row,@col+@coll,Qt::TableWidgetItem.new(@qry.value(@coll+1).toString,1))
@coll = @coll+1
@row = @row+1
end
@base.close

return @tab
else
#return
end
end
end
