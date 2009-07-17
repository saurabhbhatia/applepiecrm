require 'Qt4'

class SearchResult < Qt::Dialog

def initialize
super
setWindowTitle("Search Result")
setGeometry(200,50,500,600)
setMinimumSize(500,600)
setMaximumSize(500,600)

@userIdLabel = Qt::Label.new(self)
 @userIdLabel.setObjectName("UserIdLabel")
 @userIdLabel.setGeometry(Qt::Rect.new(50,40,150,25))
 @userIdLabel.setText("Customer ID:")
 @userIdLabel.setAlignment(Qt::AlignRight)
 @userIdLabel.setFont(Qt::Font.new("Verdana",15,Qt::Font::Bold))

@lineUserId = Qt::LineEdit.new(self)
 @lineUserId.setObjectName("UserIdLine")
 @lineUserId.setGeometry(Qt::Rect.new(240,40,225,25))
 @lineUserId.setAlignment(Qt::AlignLeft)
 @lineUserId.setFont(Qt::Font.new("verdana",13))
 @lineUserId.setReadOnly(true)
 
@userNameLabel = Qt::Label.new(self)
 @userNameLabel.setObjectName("UserNameLabel")
 @userNameLabel.setGeometry(Qt::Rect.new(30,80,200,25))
 @userNameLabel.setText("Customer Name:")
 @userNameLabel.setAlignment(Qt::AlignRight)
 @userNameLabel.setFont(Qt::Font.new("Verdana",15,Qt::Font::Bold))
    
@lineUserName = Qt::LineEdit.new(self)
 @lineUserName.setObjectName("UserName")
 @lineUserName.setGeometry(Qt::Rect.new(240,80,225,25))
 @lineUserName.setAlignment(Qt::AlignLeft)
 @lineUserName.setFont(Qt::Font.new("verdana",13))
 @lineUserName.setReadOnly(true)

@userEIDLabel = Qt::Label.new(self)
 @userEIDLabel.setObjectName("UserEIDLabel")
 @userEIDLabel.setGeometry(Qt::Rect.new(50,120,165,25))
 @userEIDLabel.setAlignment(Qt::AlignRight)
 @userEIDLabel.setText("E-Mail ID:")
 @userEIDLabel.setFont(Qt::Font.new("Verdana",15,Qt::Font::Bold))

@lineUserEID = Qt::LineEdit.new(self)
 @lineUserEID.setObjectName("UserEID")
 @lineUserEID.setGeometry(Qt::Rect.new(240,120,225,25))
 @lineUserEID.setAlignment(Qt::AlignLeft)
 @lineUserEID.setFont(Qt::Font.new("verdana",13))
 @lineUserEID.setReadOnly(true)

@userMobileLabel = Qt::Label.new(self)
 @userMobileLabel.setObjectName("UserMobileLabel")
 @userMobileLabel.setGeometry(Qt::Rect.new(50,160,165,25))
 @userMobileLabel.setText("Mobile:")
 @userMobileLabel.setAlignment(Qt::AlignRight)
 @userMobileLabel.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))

@lineMobile = Qt::LineEdit.new(self)
 @lineMobile.setObjectName("Mobile")
 @lineMobile.setGeometry(Qt::Rect.new(240,160,225,25))
 @lineMobile.setAlignment(Qt::AlignLeft)
 @lineMobile.setFont(Qt::Font.new("verdana",13))
 @lineMobile.setReadOnly(true)

@userAddressLabel = Qt::Label.new(self)
 @userAddressLabel.setObjectName("UserAddressLAbel")
 @userAddressLabel.setGeometry(Qt::Rect.new(50,200,165,25))
 @userAddressLabel.setText("Address:")
 @userAddressLabel.setAlignment(Qt::AlignRight)
 @userAddressLabel.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))
 
@textAddress = Qt::TextEdit.new(self)
 @textAddress.setObjectName("Address")
 @textAddress.setGeometry( Qt::Rect.new(240, 200, 225, 80) )
 @textAddress.setAlignment(Qt::AlignLeft)
 @textAddress.setFont(Qt::Font.new("verdana",13))
 @textAddress.setReadOnly(true)

@userIDProofLabel = Qt::Label.new(self)
 @userIDProofLabel.setObjectName("UserIDProof")
 @userIDProofLabel.setGeometry(Qt::Rect.new(50, 295, 165, 25))
 @userIDProofLabel.setText("ID Proof:")
 @userIDProofLabel.setAlignment(Qt::AlignRight)
 @userIDProofLabel.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))

@lineIDProof = Qt::LineEdit.new(self)
 @lineIDProof.setObjectName("IDProof")
 @lineIDProof.setGeometry(Qt::Rect.new(240, 295,225, 25))
 @lineIDProof.setAlignment(Qt::AlignLeft)
 @lineIDProof.setFont(Qt::Font.new("verdana",13))
 @lineIDProof.setReadOnly(true)

@userIDProofValLabel = Qt::Label.new(self)
 @userIDProofValLabel.setObjectName("IDProofVal")
 @userIDProofValLabel.setGeometry(Qt::Rect.new(50, 335,165,25))
 @userIDProofValLabel.setText("ID Number:")
 @userIDProofValLabel.setAlignment(Qt::AlignRight)
 @userIDProofValLabel.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))

@lineIDProofVal = Qt::LineEdit.new(self)
 @lineIDProofVal.setObjectName("IDProofVal")
 @lineIDProofVal.setGeometry(Qt::Rect.new(240,335,225,25))
 @lineIDProofVal.setAlignment(Qt::AlignLeft)
 @lineIDProofVal.setFont(Qt::Font.new("verdana",13))
 @lineIDProofVal.setReadOnly(true)

@userGenderLabel = Qt::Label.new(self)
 @userGenderLabel.setObjectName("UserGender")
 @userGenderLabel.setGeometry(Qt::Rect.new(50, 375,165,25))
 @userGenderLabel.setText("Gender:")
 @userGenderLabel.setAlignment(Qt::AlignRight)
 @userGenderLabel.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))

@userGender = Qt::Label.new(self)
 @userGender.setObjectName("UserGender")
 @userGender.setGeometry(Qt::Rect.new(240,375,100,25))
 @userGender.setText("Male")
 @userGender.setAlignment(Qt::AlignRight)
 @userGender.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))

@userRDateLabel = Qt::Label.new(self)
 @userRDateLabel.setObjectName("Reg Date")
 @userRDateLabel.setGeometry(Qt::Rect.new(50, 415, 165, 25))
 @userRDateLabel.setText("Reg Date:")
 @userRDateLabel.setAlignment(Qt::AlignRight)
 @userRDateLabel.setFont(Qt::Font.new("verdana",15,Qt::Font::Bold))

@lineRDate = Qt::LineEdit.new(self)
 @lineRDate.setObjectName("RDate")
 @lineRDate.setGeometry(Qt::Rect.new(240, 415,225, 25))
 @lineRDate.setAlignment(Qt::AlignLeft)
 @lineRDate.setFont(Qt::Font.new("verdana",13))
 @lineRDate.setReadOnly(true)
end



def setId(id)
@lineUserId.setText(id)
end

def setName(name)
@lineUserName.setText(name)
end

def setEID(eid)
@lineUserEID.setText(eid)
end

def setMobile(mobile)
@lineMobile.setText(mobile)
end

def setAddress(address)
@textAddress.setText(address)
end

def setIDProof(idproof)
@lineIDProof.setText(idproof)
end

def setIDProofVal(val)
@lineIDProofVal.setText(val)
end

def setGender(gender)
@userGender.setText(gender)
end

def setRDate(date)
@lineRDate.setText(date)
end
end
