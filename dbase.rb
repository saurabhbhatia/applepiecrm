require 'Qt4'

class Dbase < Qt::SqlDatabase
def initialize
super
# Database details
@driver = 'QPSQL'
@host = 'localhost'
@dbname = 'iccms'
@uname = 'postgres'
@pass = 'safew123'
@port = 5433
@dbase = Qt::SqlDatabase::addDatabase(@driver)
@dbase.setHostName(@host)
@dbase.setDatabaseName(@dbname)
@dbase.setUserName(@uname)
@dbase.setPassword(@pass)
@dbase.setPort(@port)
end

# Implementation method for New Database connection
#------>Starting<---------
def conn()
	# Opening Database Connection
	if @dbase.open()
	puts "Connection Opend"
	@qry = Qt::SqlQuery.new(@dbase)
	#sucessfully database connection is established
	return 1
	else
	#failed to establish database connection
	puts "Failed to open connection"
	return 0
	end
end
#------>Ending<---------

# Implementation method for Inserting Customer Details in Database
#------>Starting<---------
def insert(lineUserId,lineUserName,lineUserEID,lineMobile,textAddress,lineIDProof,lineIDProofVal,gender,date)
res = @qry.exec("insert into iccms_customers values('"+lineUserId+"','"+lineUserName+"','"+lineUserEID+"','"+lineMobile+"','"+textAddress+"','"+lineIDProof+"','"+lineIDProofVal+"','"+gender+"','"+date+"')")
puts @qry.lastError.text
if res
# Inserted Sucessfully
return "Registered Sucessfully"
else
# Failed to Insert 
return "There is an Internal Error, Plz try again"
end
end
#------>Ending<---------

# Implementation method for generating report
#------>Starting<---------
def generateReport()
@qry.exec("select * from iccms_customers")
#Qt::SqlDatabase::removeDatabase(@dbname)
return @qry
end
#------>Ending<---------

# Implementation method for Generation of Random CID
#------>Starting<---------
def findId()
num = rand(1000000000-9999999999)
@dbase.open()
@qry = Qt::SqlQuery.new(@dbase)
num1 = @qry.exec("select cid from iccms_customers where cid='"+num.to_s+"'")
if @qry.next
findId()
else 
return num
end
end
#------>Ending<---------

# Implementation Method for search
#------>Starting<---------
def search(name,email)
puts "i am busy with searching in database"
puts name
puts email
@dbase.open
@qry = Qt::SqlQuery.new(@dbase)
@qry.exec("select * from iccms_customers where c_name='"+name+"' and email_id='"+email+"'")
return @qry
end
#------>Ending<---------

def getById(id)
puts "i am busy with searching data by ID"
@dbase.open
@qry.exec("select * from iccms_customers where cid='"+id.to_s+"'")
puts @qry.size
if @qry.size!=0
return @qry
else
return nil
end
end

def todaysReport(date)
@dbase.open
@qry = Qt::SqlQuery.new(@dbase)
@qry.exec("select * from iccms_users where date = '"+date+"'")
puts "^^^^^^^^"
puts @qry.size
puts "^^^^^^^^"
return @qry
end

def getSystems()
puts "i am busy with Systems"
@dbase.open
@qry = Qt::SqlQuery.new(@dbase)
@qry.exec("select system_name from system_details")
return @qry
end

def newUser(cid,name,date,time,system,status)
puts "i am busy in inserting new user data"
puts cid
puts name
puts time
puts system
#puts date.toString("dd.MM.yyyy")
@dbase.open
@qry = Qt::SqlQuery.new(@dbase)
@qry.exec("insert into iccms_active_users values(nextval('customer_seq'),"+cid+",'"+name+"','"+date+"','"+time+"','"+system+"','"+status+"')")
puts @qry.lastError.text
end

def closeSession(sno,id,name,date,time,system)
puts "%%%%"
puts id
puts "im busy with closing session at database"
puts date
@dbase.open
@qry = Qt::SqlQuery.new(@dbase)
@qry.exec("delete from iccms_active_users where cid = '"+id+"'")
puts @qry.lastError.text
@qry.exec("insert into iccms_users values("+sno+",'"+id+"','"+name+"','"+date+"','"+time+"','"+system+"')")
puts @qry.lastError.text
end

def getSno(cid)
@dbase.open
@qry = Qt::SqlQuery.new(@dbase)
@qry.exec("select sno from iccms_active_users where cid ='"+cid+"'")
return @qry
end

def getSystemsActive()
@dbase.open
@qry = Qt::SqlQuery.new(@dbase)
@qry.exec("select * from iccms_active_users")
return @qry
end

def getCustomReport(fDate,lDate)
puts "(((())))"
puts fDate
puts lDate
puts "(((())))"
@dbase.open
@qry = Qt::SqlQuery.new(@dbase)
@qry.exec("select * from iccms_customers where date between '"+fDate+"' and '"+lDate+"'")
puts @qry.lastError.text
puts @qry.size
return @qry
end

end

