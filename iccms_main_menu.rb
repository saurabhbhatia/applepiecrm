require 'Qt4'
require 'iccms_new_customer_form.rb'
require 'customerList.rb'
require 'search.rb'
require 'dbase.rb'
require 'searchResult.rb'
require 'systemsStatus.rb'
require 'todaysReport.rb'
require 'customSearch.rb'
require 'customSearchReport.rb'

class MainMenu < Qt::Widget
# ------>Starting MainMenu Class<----------

# Declaring Slots
slots 'newCustomer()', 'home()', 'customersReport()', 'existingCustomer()', 'searchCust()','sStatus()','showTime()','todaysReport()','customSearch()'

def initialize
# ------>Starting initialization<----------
	super
	setFont(Qt::Font.new('verdana',10,Qt::Font::Bold))
	setToolTip('Internet Cafe Customer Management System')
	setWindowTitle('Internet Cafe Customer Management System (I.C.C.M.S.) by SAFEW')

# Creating an Timer Object for Displaying Time
# ------>Starting<----------
@timer = Qt::Timer.new
@time = Qt::Label.new(self)
@time.setGeometry(800,5,150,15)
@time.setFont(Qt::Font.new("verdana",12))
# ------>Ending<----------
# Starting timer with a time gap of 1 Secound
@timer.start(1000)
# Calling showTime() method to Display Time
showTime()

# Creating a Label for Title
# ------>Starting<----------
@titleLabel = Qt::Label.new(self)
 @titleLabel.setObjectName("Developer")
 @titleLabel.setGeometry(Qt::Rect.new(0,100,1000,250))
 @titleLabel.setText("<h2>Internet Cafe Customer Management System<br><i><u>Designed and Developed</u></i> <br>by          </h2><h1 style='color:red;'>SAFEW Technology Labs (STL)</h1><h2>India</h2>")
 @titleLabel.setAlignment(Qt::AlignCenter)
# ------>Ending<----------

# Creating Object for NewCustomer
@newCustomer = NewCustomer.new
@ss= SystemsStatus.new

# Creating the Menu Bar
# ------>Starting<----------
@menubar = Qt::MenuBar.new(self)
 @menubar.setObjectName('menubar')
 @menubar.setFont(Qt::Font.new('verdana',13))
# ------>Ending<----------

# Creating the top level Menu Items
# ------>Starting<----------

@menuOperations = Qt::Menu.new(@menubar)
 @menuOperations.setObjectName('menuOperations')
 @menuOperations.setTitle('&Operations')
 @menuOperations.setFont(Qt::Font.new('verdana',10))

@menuReports = Qt::Menu.new(@menubar)
 @menuReports.setObjectName('menuReports')
 @menuReports.setTitle('&Reports')
 @menuReports.setFont(Qt::Font.new('verdana',10))

@menuSearch = Qt::Menu.new(@menubar)
 @menuSearch.setObjectName('menuSearch')
 @menuSearch.setTitle('&Search')
 @menuSearch.setFont(Qt::Font.new('verdana',10))

# ------>Ending<----------


# Adding the top level Menu Items to the Menu Bar
# ------>Starting<----------
@menubar.addAction(@menuOperations.menuAction())
@menubar.addAction(@menuReports.menuAction())
@menubar.addAction(@menuSearch.menuAction())
# ------>Ending<----------

# creating Menu actions for File Menu Items
# ------>Starting<----------
@actionStatus = Qt::Action.new(self)
 @actionStatus.setObjectName('actionStatus')
 @actionStatus.setText('Show Status')
 @actionStatus.setShortcut('Ctrl+T')

@actionHome = Qt::Action.new(self)
 @actionHome.setObjectName('actionHome')
 @actionHome.setText('Home')
 @actionHome.setShortcut('Ctrl+H')
 
@actionNew = Qt::Action.new(self)
 @actionNew.setObjectName('actionNew')
 @actionNew.setShortcut('Ctrl+N')
 @actionNew.setText('New Customer')

@actionExisting = Qt::Action.new(self)
 @actionExisting.setObjectName('actionExt')
 @actionExisting.setText('Existing Customer')
 @actionExisting.setShortcut('Ctrl+E')
 
@actionExit = Qt::Action.new(self)
 @actionExit.setObjectName('actionExit')
 @actionExit.setText('Exit')
 @actionExit.setShortcut('Ctrl+X')
# ------>Ending<----------

# creating Menu Actions for Reports Menu Bar
# ------>Starting<----------
@actionToDayReport = Qt::Action.new(self)
 @actionToDayReport.setObjectName('actionToDayReport')
 @actionToDayReport.setText('To Day\'s Report')
 @actionToDayReport.setShortcut('Ctrl+D')

@actionCustomReport = Qt::Action.new(self)
 @actionCustomReport.setObjectName('actionCustomReport')
 @actionCustomReport.setText('Custom Report')
 @actionCustomReport.setShortcut('Ctrl+C')

@actionCustomerList = Qt::Action.new(self)
 @actionCustomerList.setObjectName('actionCustomerList')
 @actionCustomerList.setText('Customer List')
 @actionCustomerList.setShortcut('Ctrl+L')
# ------>Ending<----------

# creating Menu Actions for Search Menu Bar
# ------>Starting<----------
@actionSearchCust = Qt::Action.new(self)
 @actionSearchCust.setObjectName('actionSearchCust')
 @actionSearchCust.setText('Search For Customer')
 @actionSearchCust.setShortcut('Ctrl+F')
# ------>Ending<----------

# Attach Actions to Top Level Menu Items
# ------>Starting<----------
@menuOperations.addAction(@actionStatus)
@menuOperations.addSeparator
@menuOperations.addAction(@actionNew)
@menuOperations.addAction(@actionExisting)
 @menuOperations.addSeparator
@menuOperations.addAction(@actionHome)
 @menuOperations.addSeparator
@menuOperations.addAction(@actionExit)
@menuReports.addAction(@actionToDayReport)
@menuReports.addAction(@actionCustomReport)
 @menuReports.addSeparator
@menuReports.addAction(@actionCustomerList)
@menuSearch.addAction(@actionSearchCust)
# ------>Ending<----------

@dbase = Dbase.new

# Connections for Actions
# ------>Starting<----------
connect(@actionNew,SIGNAL('triggered()'),self,SLOT('newCustomer()'))
connect(@actionExisting,SIGNAL('triggered()'),self,SLOT('existingCustomer()'))
connect(@actionHome,SIGNAL('triggered()'),self,SLOT('home()'))
connect(@actionExit,SIGNAL('triggered()'),$qApp,SLOT('quit()'))
connect(@actionCustomerList,SIGNAL('triggered()'),self,SLOT('customersReport()'))
connect(@actionSearchCust,SIGNAL('triggered()'),self,SLOT('searchCust()'))
connect(@actionStatus,SIGNAL('triggered()'),self,SLOT('sStatus()'))
connect(@actionToDayReport,SIGNAL('triggered()'),self,SLOT('todaysReport()'))
connect(@actionCustomReport,SIGNAL('triggered()'),self,SLOT('customSearch()'))
connect(@timer,SIGNAL('timeout()'),self,SLOT('showTime()'))
# ------>Ending<----------
# ------>Ending Initialization<----------
end

# Implementation Method for SLOT-home()
# ------>Starting<----------
def home()
@ss.close
 @titleLabel.setVisible(true)
 @actionNew.setVisible(true)
setWindowTitle('Internet Cafe Customer Management System (I.C.C.M.S.) by SAFEW')
end
# ------>Ending<----------

# Implementation Method for SLOT-newCustomer
# ------>Starting<----------
def newCustomer()
@newCustomer.setWindowTitle('I.C.C.M.S. -> New Customer Details')
@newCustomer.exec
end
# ------>Ending<----------

# Implementation Method for SLOT-customersReport()
# ------>Starting<----------
def customersReport()
@customersReport = CustomersReport.new
puts "Im generating Customers Report"
@customersReport.exec
end
# ------>Ending<----------

# Implementation Method for SLOT-newCustomer()
# ------>Starting<----------
def existingCustomer()
puts "I am searching for existing customer"
@ok = Qt::Boolean.new
@text = Qt::LineEdit::Normal
@cID = Qt::InputDialog::getText(self,"Input Customer ID","Enter Customer ID",Qt::LineEdit::Normal,"",@ok)
puts @cID
puts "OK Pressed"
	if @cID == "" || @cID == nil
	puts "Customer Id Not Entered"
	else
	puts "Customer Id Entered"
	puts "Entered Customer Id is "+@cID
	end
end
# ------>Ending<----------

# Implementation Method for SLOT-searchCust()
# ------>Starting<----------
def searchCust()
puts "I am busy in searching Customer"
search = SCustomer.new
search.exec
id = search.getLineId()
dob = search.getMobile()
puts id
puts dob
if ((id!="" && id!=nil) && (dob!="" && dob!=nil))
@dbase.conn
@qry = @dbase.search(id,dob)
if @qry.size==0
 Qt::MessageBox::critical(self,"Message" , "Record Not Found" )
else
@qry.next
@sr = SearchResult.new
@sr.setId(@qry.value(0).toString)
@sr.setName(@qry.value(1).toString)
@sr.setEID(@qry.value(2).toString)
@sr.setMobile(@qry.value(3).toString)
@sr.setAddress(@qry.value(4).toString)
@sr.setIDProof(@qry.value(5).toString)
@sr.setIDProofVal(@qry.value(6).toString)
@sr.setGender("Male")
if @qry.value(7).toString == 'm'
else
@sr.setGender("Female")
end
@sr.setRDate(@qry.value(8).toString)
@sr.exec
end
end
end
# ------>Ending<----------

# Implementation method for SLOT-sStatus()
# ------>Starting<----------
def sStatus()
puts 'generating systems status'
@ss.exec
end
# ------>Ending<----------

# Implementation method showTime()
# ------>Starting<----------
def showTime()
time = Qt::Time::currentTime()
text = time.toString("hh:mm")
if((time.second() % 2) ==0)
text[2] = ' '
end
@time.setText("Time:"+text)
end
# ------>Ending<----------

# Implementation method for todaysReport()
## ------>Starting<----------
def todaysReport()
puts "Im generating Todays Report"
@today = TodaysReport.new
@today.exec
end
# ------>Ending<----------

# Implementation method for customReport()
# ------>Starting<----------
def customSearch()
puts "custom Search"
crDate = CustomSearch.new
res = crDate.exec
puts res
if !res
puts "not zero"
@fDate = Qt::Date.new
@lDate = Qt::Date.new
@fDate = crDate.getFDate()
@lDate = crDate.getLDate()
#@fDate = @fDate.toString("yyyy-MM-dd")
#@lDate = @lDate.toString("yyyy-MM-dd")
puts @fDate
puts @lDate
csr = CustomSearchReport.new
csr.genReport(@fDate,@lDate)
csr.exec
#@qry = @dbase.getCustomReport(@fDate,@lDate)
#if(@qry.size!=0)
#puts "Records found"

#end
else
 Qt::MessageBox::critical(self,"Message" , "Record Not Found" )
end
end
# ------>Ending<----------

end
# ------>Ending MainMenu Class<----------
