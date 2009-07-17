require 'Qt4'
require 'dbase.rb'

class NewCustomer < Qt::Dialog
# ------>Starting NewCustomer Class<----------

# Declaring Slots
slots 'resetForm()', 'subb()', 'loadImage()'

def initialize
# ------>Starting initialization<----------
super

# Creating Dbase Object
# ------>Starting<----------
@dbase = Dbase.new
# ------>Ending<----------

# Creating a Label for Title
# ------>Starting<----------
@titleLabel = Qt::Label.new(self)
 @titleLabel.setObjectName("Heading")
 @titleLabel.setGeometry(Qt::Rect.new(180,-10,700,100))
 @titleLabel.setText("Internet Cafe Customer Management System")
 @titleLabel.setAlignment(Qt::AlignCenter)
 @titleLabel.setFont(Qt::Font.new("Verdana",20,Qt::Font::Bold))
# ------>Ending<----------

# Creating a Label for submitResult
# ------>Starting<----------
@submitResult = Qt::Label.new(self)
 @submitResult.setGeometry(Qt::Rect.new(245,55,600,25))
 @submitResult.setAlignment(Qt::AlignCenter)
 @submitResult.setFont(Qt::Font.new("Verdana",12,Qt::Font::Bold))
# ------>Ending<----------

# Creating a Label for userId
# ------>Starting<----------
@userIdLabel = Qt::Label.new(self)
 @userIdLabel.setObjectName("UserIdLabel")
 @userIdLabel.setGeometry(Qt::Rect.new(150,90,265,25))
 @userIdLabel.setText("Customer ID:")
 @userIdLabel.setAlignment(Qt::AlignRight)
 @userIdLabel.setFont(Qt::Font.new("Verdana",15,Qt::Font::Bold))
# ------>Ending<----------

# Creating a Line for userId input
# ------>Starting<----------
@lineUserId = Qt::LineEdit.new(self)
 @lineUserId.setObjectName("UserIdLine")
 @lineUserId.setGeometry(Qt::Rect.new(440,90,225,25))
 @lineUserId.setAlignment(Qt::AlignLeft)
 @lineUserId.setFont(Qt::Font.new("verdana",13))
 @lineUserId.setReadOnly(true)
 @lineUserId.setText(@dbase.findId().to_s)
# ------>Ending<----------

# Creating a Label for userName
# ------>Starting<----------
@userNameLabel = Qt::Label.new(self)
 @userNameLabel.setObjectName("UserNameLabel")
 @userNameLabel.setGeometry(Qt::Rect.new(150,130,265,25))
 @userNameLabel.setText("Customer Name:")
 @userNameLabel.setAlignment(Qt::AlignRight)
 @userNameLabel.setFont(Qt::Font.new("Verdana",15,Qt::Font::Bold))
# ------>Ending<----------

# Creating a Line for userName input
# ------>Starting<----------
@lineUserName = Qt::LineEdit.new(self)
 @lineUserName.setObjectName("UserName")
 @lineUserName.setGeometry(Qt::Rect.new(440,130,225,25))
 @lineUserName.setAlignment(Qt::AlignLeft)
 @lineUserName.setFont(Qt::Font.new("verdana",13))
# ------>Starting<----------

 # Creating a Label for userName Error
 # ------>Starting<----------
  @userNameError = Qt::Label.new(self)
  @userNameError.setGeometry(Qt::Rect.new(680,130,250,25))
  # ------>Ending<----------

# Creating a Label for userEmaiID
# ------>Starting<----------
@userEIDLabel = Qt::Label.new(self)
 @userEIDLabel.setObjectName("UserEIDLabel")
 @userEIDLabel.setGeometry(Qt::Rect.new(150,170,265,25))
 @userEIDLabel.setAlignment(Qt::AlignRight)
 @userEIDLabel.setText("E-Mail ID:")
 @userEIDLabel.setFont(Qt::Font.new("Verdana",15,Qt::Font::Bold))
# ------>Ending<----------

# Creating a Line for userEmailID input
# ------>Starting<----------
@lineUserEID = Qt::LineEdit.new(self)
 @lineUserEID.setObjectName("UserEID")
 @lineUserEID.setGeometry(Qt::Rect.new(440,170,225,25))
 @lineUserEID.setAlignment(Qt::AlignLeft)
 @lineUserEID.setFont(Qt::Font.new("verdana",13))
# ------>Ending<----------

 # Creating a Label for userEmailID Error
 # ------>Starting<----------
  @userEIDError = Qt::Label.new(self)
  @userEIDError.setGeometry(Qt::Rect.new(680,170,250,25))
 # ------>Ending<----------

# Creating a Label for userMobile
# ------>Starting<----------
@userMobileLabel = Qt::Label.new(self)
 @userMobileLabel.setObjectName("UserMobileLabel")
 @userMobileLabel.setGeometry(Qt::Rect.new(150,210,265,25))
 @userMobileLabel.setText("Mobile:")
 @userMobileLabel.setAlignment(Qt::AlignRight)
 @userMobileLabel.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))
# ------>Ending<----------

# Creating a Line for userMobile input
# ------>Starting<----------
@lineMobile = Qt::LineEdit.new(self)
 @lineMobile.setObjectName("Mobile")
 @lineMobile.setGeometry(Qt::Rect.new(440,210,225,25))
 @lineMobile.setAlignment(Qt::AlignLeft)
 @lineMobile.setFont(Qt::Font.new("verdana",13))
# ------>Ending<----------

 # Creating a Label for userEmailID Error
 # ------>Starting<----------
  @userMobileError = Qt::Label.new(self)
  @userMobileError.setGeometry(Qt::Rect.new(680,210,250,25))
 # ------>Starting<----------

# Creating a Label for userAddress
# ------>Starting<----------
@userAddressLabel = Qt::Label.new(self)
 @userAddressLabel.setObjectName("UserAddressLAbel")
 @userAddressLabel.setGeometry(Qt::Rect.new(150,250,265,25))
 @userAddressLabel.setText("Address:")
 @userAddressLabel.setAlignment(Qt::AlignRight)
 @userAddressLabel.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))
# ------>Ending<----------

# Creating a Line for userAddress input
# ------>Starting<----------
@textAddress = Qt::TextEdit.new(self)
 @textAddress.setObjectName("Address")
 @textAddress.setGeometry( Qt::Rect.new(440, 250, 225, 80) )
 @textAddress.setAlignment(Qt::AlignLeft)
 @textAddress.setFont(Qt::Font.new("verdana",13))
# ------>Ending<----------

 # Creating a Label for userEmailID Error
 # ------>Starting<----------
  @addressError = Qt::Label.new(self)
  @addressError.setGeometry(Qt::Rect.new(680,250,250,25))
 # ------>Ending<----------

# Creating a Label for userIDProof
# ------>Starting<----------
@userIDProofLabel = Qt::Label.new(self)
 @userIDProofLabel.setObjectName("UserIDProof")
 @userIDProofLabel.setGeometry(Qt::Rect.new(150, 345, 265, 25))
 @userIDProofLabel.setText("ID Proof:")
 @userIDProofLabel.setAlignment(Qt::AlignRight)
 @userIDProofLabel.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))
# ------>Ending<----------

# Creating a Line for userIDProof input
# ------>Starting<----------
@lineIDProof = Qt::LineEdit.new(self)
 @lineIDProof.setObjectName("IDProof")
 @lineIDProof.setGeometry(Qt::Rect.new(440, 345,225, 25))
 @lineIDProof.setAlignment(Qt::AlignLeft)
 @lineIDProof.setFont(Qt::Font.new("verdana",13))
# ------>Ending<----------

 # Creating a Label for userEmailID Error
 # ------>Starting<----------
  @idProofError = Qt::Label.new(self)
  @idProofError.setGeometry(Qt::Rect.new(680,345,250,25))
# ------>Ending<----------

# Creating a Label for userIDProofValue
# ------>Starting<----------
@userIDProofValLabel = Qt::Label.new(self)
 @userIDProofValLabel.setObjectName("IDProofVal")
 @userIDProofValLabel.setGeometry(Qt::Rect.new(150, 385,265,25))
 @userIDProofValLabel.setText("ID Number:")
 @userIDProofValLabel.setAlignment(Qt::AlignRight)
 @userIDProofValLabel.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))
# ------>Ending<----------

# Creating a Line for userIDProofValue input
# ------>Starting<----------
@lineIDProofVal = Qt::LineEdit.new(self)
 @lineIDProofVal.setObjectName("IDProofVal")
 @lineIDProofVal.setGeometry(Qt::Rect.new(440,385,225,25))
 @lineIDProofVal.setAlignment(Qt::AlignLeft)
 @lineIDProofVal.setFont(Qt::Font.new("verdana",13))
# ------>Ending<----------

# Creating a Label for userEmailID Error
# ------>Starting<----------
 @idProofValError = Qt::Label.new(self)
 @idProofValError.setGeometry(Qt::Rect.new(680,385,250,25))
# ------>Ending<----------

# Creating a Label for userGender
# ------>Starting<----------
@userGenderLabel = Qt::Label.new(self)
 @userGenderLabel.setObjectName("UserGender")
 @userGenderLabel.setGeometry(Qt::Rect.new(150, 425,265,25))
 @userGenderLabel.setText("Gender:")
 @userGenderLabel.setAlignment(Qt::AlignRight)
 @userGenderLabel.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))
# ------>Ending<----------

# Creating a Line for userGender input
# ------>Starting<----------
@radioMGender = Qt::RadioButton.new("Male",self)
 @radioMGender.setGeometry(440,425,60,25)
 @radioFGender = Qt::RadioButton.new("Female",self)
 @radioFGender.setGeometry(500,425,80,25)
# ------>Ending<----------

# Creating a Label for userGender Error
# ------>Starting<----------
 @userGenderError = Qt::Label.new(self)
 @userGenderError.setGeometry(Qt::Rect.new(600,425,250,25))
# ------>Ending<----------

# Creating a Label for userPicture
# ------>Starting<----------
@userPic = Qt::Label.new(self)
 @userPic.setObjectName("UserPic")
 @userPic.setGeometry(Qt::Rect.new(150,485,265,25))
 @userPic.setText("User Pic:")
 @userPic.setAlignment(Qt::AlignRight)
 @userPic.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))
# ------>Ending<----------

# Creating a PushButton for Browse a picture file
# ------>Starting<----------
@browse = Qt::PushButton.new(self)
 @browse.setShortcut('Ctrl+B')
 @browse.setObjectName("browseuserpic")
 @browse.setText("Browse Image")
 @browse.setGeometry(Qt::Rect.new(480,475,180,50))
 @newFont = Qt::Font.new
 @newFont.setBold(true)
 @newFont.setItalic(true)
 @browse.setFont(@newFont)
# ------>Ending<---------- 

# Creating a PushButton for Submit
# ------>Starting<----------
@submitButton = Qt::PushButton.new(self)
 @submitButton.setShortcut('Ctrl+S')
 @submitButton.setObjectName("submitButton")
 @submitButton.setText("Submit")
 @submitButton.setGeometry(Qt::Rect.new(320,580,150,50))
 @submitButton.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))
# ------>Starting<----------

@resetButton = Qt::PushButton.new(self)
 @resetButton.setShortcut('Ctrl+R')
 @resetButton.setObjectName("resetButton")
 @resetButton.setText("Reset")
 @resetButton.setGeometry(Qt::Rect.new(540,580,150,50))
 @resetButton.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))

@poweredLabel = Qt::Label.new(self)
 @poweredLabel.setText("Powered by SAFEW Technology Labs (STL), INDIA.")
 @poweredLabel.setObjectName("PoweredLabel")
 @poweredLabel.setGeometry(Qt::Rect.new(300,650,450,70))
 @poweredLabel.setFont(Qt::Font.new("verdana",10))
 @poweredLabel.setAlignment(Qt::AlignCenter)


@msgbox = Qt::MessageBox.new(self)
@image_label = Qt::Label.new(self)
@image_label.setGeometry(Qt::Rect.new(800,200,100,100))
@image_label.setText("Customer Pic")

connect(@resetButton,SIGNAL('clicked()'),self,SLOT('resetForm()'))
connect(@submitButton,SIGNAL('clicked()'),self,SLOT('subb()'))
connect(@browse,SIGNAL('clicked()'),self,SLOT('loadImage()'))
self.clearFocus
@lineUserName.setFocus

@date = Qt::Date.new
puts @date.currentDate.toString
end

def subb()

name = @lineUserName.text
name = name.strip
if name.length==0
@userNameError.setText("<h4 style='color:red;'><u>Please Enter valid User Name</u></h4>")
@lineUserName.setFocus
return
else
@userNameError.clear
end

eid = @lineUserEID.text
eid = eid.strip 
if eid.length==0
@userEIDError.setText("<h4 style='color:red;'><u>Please Enter Email ID</u></h4>")
@lineUserEID.setFocus
return
#elsif @lineUserEID.text!=""
#/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/
else
@userEIDError.clear
end

mobile = @lineMobile.text
mobile = mobile.strip
if mobile.length == 0
@userMobileError.setText("<h4 style='color:red;'><u>Please Enter Mobile Number</u></h4>")
@lineMobile.setFocus
return
else
@userMobileError.clear
end

address = @textAddress.toPlainText
address = address.strip
if address.length == 0
@addressError.setText("<h4 style='color:red;'><u>Please Enter Address</u><h4>")
@textAddress.setFocus
return
else
@addressError.clear
end

idProof = @lineIDProof.text
idProof = idProof.strip
if idProof.length == 0
@idProofError.setText("<h4 style='color:red;'><u>Please Enter ID Proof</u></p>")
@lineIDProof.setFocus
return
else
@idProofError.clear
end

idProofVal = @lineIDProofVal.text
idProofVal = idProofVal.strip
if idProofVal.length == 0
@idProofValError.setText("<h4 style='color:red;'><u>Please Enter ID Proof Value</u></p>")
@lineIDProofVal.setFocus
return
else
@idProofValError.clear
end


if @radioMGender.isChecked==false && @radioFGender.isChecked==false
@userGenderError.setText("<h4 style='color:red;'><u>Plesase Enter Your Gender</u></h4>")
#elsif male==true
#@msgbox.information(self,"Your Gender" , malevalue )
#else
#@msgbox.information(self,"Your Gender" , femalevalue )
return
else
@userGenderError.clear
end
@dbase = Dbase.new
if @dbase.conn
res = @dbase.insert(@lineUserId.text,@lineUserName.text,@lineUserEID.text,@lineMobile.text,@textAddress.toPlainText,@lineIDProof.text,@lineIDProofVal.text,'m',@date.currentDate.to_String)
resetForm()
@submitResult.setText("<h4 style='color:red;'>"+res+"<h4>")
end

end

def resetForm()
@lineUserId.clear
@lineUserName.clear
@userNameError.clear
@lineUserEID.clear
@userEIDError.clear
@lineMobile.clear
@userMobileError.clear
@textAddress.clear
@addressError.clear
@lineIDProof.clear
@lineIDProofVal.clear
@userGenderError.clear
@lineUserName.setFocus
@image_label.setText("Customer Pic")
@lineUserId.setText(@dbase.findId().to_s)
@submitResult.setText("")
end

def loadImage()
@img_new = Qt::FileDialog::getOpenFileName(self,'New Customer Image','/home','Image Files(*.png *.gif *.jpg *.jpeg)')
puts @img_new
puts "*******"
@pix_new = Qt::Pixmap.new(100,100)
@pix_new.load(@img_new)
#@pix_new.scaled(100,100,0,0)
#@pix_new.scaledToWidth(100,0)
@pix_new.scaled(Qt::Size.new(100,100),1,1)
@image_label.setPixmap(@pix_new)
#@img_new = Qt::FileDialog::getOpenFileName(self,'Open Image','./home/safew/Raju/Ruby/QT','Image Files(*.png *.jpg *.gif *.jpeg *.ico)')
#@label_new.setGeometry(100,175,200,200)
#@pix_new = Qt::Pixmap.new(@img_new)
#@label_new.setPixmap(@pix_new)
end

def closeEvent(event)
resetForm()
end
end
