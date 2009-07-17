require 'Qt4'

class SCustomer < Qt::Dialog
slots 'ok()', 'cancel()'
	def initialize
	super
	setWindowTitle("Searching Customer")
	setFont(Qt::Font.new("verdana", 10))
	setGeometry(400,250,350,125)
	@note = Qt::Label.new(self)
	@note.setText('<h5 style="color:red">* all fields are required<h5>')
	@note.setGeometry(100,17,200,15)
	@note.setFont(Qt::Font.new("verdana",8))
	
	@name = Qt::Label.new(self)
	@name.setText("Customer Name:")
	@name.setGeometry(0,35,120,25)
	@name.setAlignment(Qt::AlignRight)
	@lineId = Qt::LineEdit.new(self)
	@lineId.setGeometry(125,35,150,25)
	@mobile = Qt::Label.new(self)
	@mobile.setAlignment(Qt::AlignRight)
	@mobile.setText("Email ID:")
	@mobile.setGeometry(0,70,120,25)
	@lineMobile = Qt::LineEdit.new(self)
	@lineMobile.setGeometry(125,70,150,25)
	# Validator for only number
#	@linePhone.setValidator(Qt::IntValidator.new(self))
	@ok = Qt::PushButton.new(self)
	@ok.setText("Ok")
	@ok.setGeometry(290,35,50,25)
	@cancel = Qt::PushButton.new(self)
	@cancel.setText("Cancel")
	@cancel.setGeometry(290,70,50,25)

	connect(@ok,SIGNAL('clicked()'),self,SLOT('ok()'))
	connect(@cancel,SIGNAL('clicked()'),self,SLOT('cancel()'))
	end

	def ok()
	puts "ok pressed"
	if((@lineId.text!="")&&(@lineMobile.text!=""))
	puts "@@@@@@@@@@@"
	self.close
	else
	end
	return
	end

	def getLineId()
	return @lineId.text
	end
	
	def getMobile()
	return @lineMobile.text
	end
	
	def cancel()
	self.close
	end
	
end
