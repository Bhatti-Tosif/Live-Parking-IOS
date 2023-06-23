//
//  Structures.swift
//  TagBDemo
//
//  Created by Yagnik Suthar on 21/10/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    static let environment: String = {
        #if Production
        return "Production"
        #elseif Development
        return "Development"
        #else
        return "Staging"
        #endif
    }()
    static let compressionQuality: CGFloat = 0.5
    static let lowCompressionQuality: CGFloat = 0.35
    static let zero = 0
    static let openActionItemId = 1
    static let completedTaskId = 4
    static let cancelledTaskId = 5
    static let heightForHeaderInSectionActivity: CGFloat = 50
    static let heightForHeaderSelectedSpace: CGFloat = 30
    static let deviceType = "ios"
    static let defaultMimeType = "application/octet-stream"
    static let gridHeightMultiplier: CGFloat = 175
    static let totalHeightDiviser: CGFloat = 375
    static let listHeightMultiplier: CGFloat = 75
    static let headerHeight: CGFloat = 40
    static let listWidthPadding: CGFloat = 20
    static let popOverTableWidth: CGFloat = 2
    static let popOverTableHeight: Int = 50
    static let popOverTableStartPoint: CGFloat = 160
    static let popOverTableOptionWidth: CGFloat = 10
    static let gridWidthPadding: CGFloat = 40
    static let maxContainerHeightAbove8Plus: CGFloat = 320
    static let maxContainerHeightBlow8Plus: CGFloat = 280
    static let minContainerHeight: CGFloat = 254
    static let refrenceHeight: CGFloat = 739
    static let popoverCellHeight: CGFloat = 60
    static let popoverWidth: CGFloat = 300
    static let downloadFooterHeight: CGFloat = 60
    static let downloadHeaderHeight: CGFloat = 20
    static let completionHeight: CGFloat = 80
    static let navigationViewHeight: CGFloat = 25
    static let singleRowPadding: CGFloat = 46
    static let multipleRowPadding: CGFloat = 26
    static let bottomInset: CGFloat = 75
    static let maxDropDownCells: Int = 10
    static let dropDownRowHeight: Int = 40
    static let dropDownCellIdentifier = "dropCellIdentifier"
    static let taskEditingHeight: CGFloat = 70
    static let taskNormalHeight: CGFloat = 10
    static let headerHeightMultiplier: CGFloat = 68
    static let taskHeaderWidthPadding: CGFloat = 16
    static let phoneNumberFormat: String = "(###) ###-####"
    static let pickerHeight: CGFloat = 250
    static let textMessageMaxCount: Int = 100
    static let releaseVersion: String = {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }()
    static var buildVersion: String = {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }()
    static let minSpaceStatusHeight: CGFloat = 40
    static let maxSpaceStatusHeight: CGFloat = 180
    static let tagFlowLayoutEstimatedSize: CGSize = CGSize(width: 140, height: 40)
    static let chatTextViewLimit: CGFloat = 3
    static let overdueActionItemStatus: Int = 3
    static let completedActionItemStatus: Int = 2
    static let cardHeaderHeight: CGFloat = 45
    static let paypalHeaderHeight: CGFloat = 87
    static let paymentDetailsHeaderHeight: CGFloat = 50
    static let paymentDetailsFooterHeight: CGFloat = 5
    static let deletPopupWidth: CGFloat = 150
    static let deletPopupBottomPadding: CGFloat = 10
    static let notificationHeaderHeight: CGFloat = 42
    static let notificationFooterHeight: CGFloat = 10
    static let kingfisherCacheMemorySize = 1024 * 1024 * 10 * 100
    static let timeInterval: Int = 5
    static let timeIntervalTill: Int = 7
    static let initialInterval: Int = 1
    static let dayIntervalTill: Int = 16
    static let kRotationAnimationKey = "rotationanimationkey"
    static let newLine: Character = "\n"
    static let termsAndConditions = "https://runparking.com/runparking-termsandcondition"
    static let help = "https://runparking.com/runparking-help"
    static let privacyPolicy = "https://runparking.com/runparking-privacypolicy"
    static let ignoreUrl = "ProfileImage/image"
    static let homeCollectionWidth: CGFloat = 325
    static let currentReservationHeight: CGFloat = 320
    static let bottomSheetTopLeftRightRadius: CGFloat = 22
    static let locationDataKey = "locationDataKey"
    static let fromDateKey = "fromDateKey"
    static let toDateKey = "toDateKey"
    static let reservationType = "reservationType"
    static let reservationId = "reservationId"
    static let paypalAccount = "paypal_account"
    static let creditCard = "credit_card"
    static let parkingLotId = "parkingLotId"
    static let specificParkingLotId = "specificParkingLotId"
    static let baseAmount = "baseAmount"
    static let charge = "charge"
    static let vehicleID = "vehicleID"
    static let stateCode = "stateCode"
    static let licensePlateNumber = "licensePlateNumber"
    static let unblockedBy = "unblockedBy"
    static let blockedBy = "blockedBy"
    static let conversationId = "conversationId"
    static let thankYouHeaderHeight: CGFloat = 151
    static let singleCellForRow: Int = 1
    static let singleBadgeCount: Int = 1
    static let doubleCellForRow: Int = 2
    static let heightForPhotosCollection: CGFloat = 100
    static let heightForVeirfyTableCell: Int = 60
    static let zipCodeMaxLength: Int = 10
    static let vehicleYearMaxLength: Int = 4
    static let cardNumberMaxLength: Int = 18
    static let cardNumberMinLength: Int = 13
    static let maxAmenitiesTableHeight: CGFloat = mainScreenBounds.height * 0.7
    static let minAmenitiesTableHeight: CGFloat = 100
    static let day1: Int = 1
    static let valueTen: Float = 10
    static let nameMaxLength: Int = 17
    static let cvvMaxLength: Int = 4
    static let sourceKey = "Source"
    static let destinationKey = "Destination"
    static let pdfFileName = "reservation-"
    static let fileConstants = "file://"
    static let currentReservationWidth: CGFloat = 329
    static let notificationType = "notificationType"
    static let type = "type"
    static let aps = "aps"
    static let data = "data"
    static let status = "status"
    static let bookingNumber = "bookingNumber"
    static let unpaid = "unpaid"
    static let paid = "paid"
    static let id = "id"
    static let heightForAmenities: CGFloat = 20
    static let twelveAMTime = "12:00 AM"
    static let twelveOclock = "12:00"
    static let isBusiness = "isBusiness"
    static let filterContainerHeightWithoutBottomSpace: CGFloat = 315
    static let addCardContainerHeightWithoutBottomSpace: CGFloat = 345
    static let addCardContainerHeightWithBottomSpace: CGFloat = 390
    static let addDriverContainerHeightWithoutBottomSpace: CGFloat = 400
    static let addDriverContainerHeightWithBottomSpace: CGFloat = 445
    static let chatViewContainerBottomConstraints: CGFloat = 20
    static let multipleSpaceHeightConstraint: CGFloat = 665
    static let addReservationHeightConstraint: CGFloat = 415
    static let viewHeightConstraint: CGFloat = 550
    static let changeEmailContainerHeightWithoutBottomSpace: CGFloat = 404
    static let changeEmailContainerHeightWithBottomSpace: CGFloat = 444
    static let heightForBusinessCollection: CGFloat = 370
    static let heightForCustomerCollection: CGFloat = 340
    static let heightForPassDetailsCollection: CGFloat = 264
    static let checkoutCellheaderHeight: CGFloat = 20
    static let heightForInviteCollectionCell: CGFloat = 40
    static let widthForInviteCollectionCell: CGFloat = 30
    static let heightForCoverImage: CGFloat = 241
    static let heightForInviteHeader: CGFloat = 50
    static let chatPageSize: UInt = 100
    static let onePageEventLimit: UInt = 1
    static let defaultRating: Double = 0.0
    static let chatEventTypes = "image,text"
    static let groupChat = "Group Chat"
    static let groupChatPreSignedKey = "group_chat_profile"
    static let trueString = "true"
    static let parkingCitationKey = "parking_citation"
    static let disputeCitationKey = "dispute_citation"
    static let left = "left"
    static let right = "right"
    static let front = "front"
    static let rear = "rear"
    static let notifyCustomerKey = "notify_customer"
    static let notifyEnforcerCustomerKey = "enforcer_notify_customer"
    static let notifyAttendantMessageKey = "notify_customer_status"
    static let parkingDetailsKey = "parking_details"
    static let contentLimit: Int = 10
    static let defaultCountryCode = "US"
    static let defaultDialCode = "+1"
    static let imageCompressionQuality = 0.9
    static let zeroAM = "00:00 AM"
    static let twelveAM = "11:59 PM"
    static let stringFormatPercent = "%02d"
    static let chatEventsPageSize: UInt = 15
    static let applePayPaymentMethodType = "applePay"
    static let contentHeightFromCheckoutForAddVehicle: CGFloat = 420
    static let contentHeightForAddVehicle: CGFloat = 550
    static let businessName: String = "Run Parking"
    static let redBorderColor = UIColor.red.cgColor
    static let grayBorderColor = UIColor.lightGray.cgColor
    static let clearBorderColor = UIColor.clear.cgColor
    static let badgeCountValue: Int = 9
    static let disableAlpha: CGFloat = 0.4
    static let hyphenUniCodeChar: String = "\u{2011}"
    static let resendOTPTimerInSec = 60
    static let payrollFilterContainerBottomSpace: CGFloat = 30
    static let payrollFilterContainerTopSpace: CGFloat = 10
    static let contentHeightForAddRefundRequestFooter: CGFloat = 180
}

struct APIHeaderKeys {
    static let accept = "Accept"
    static let applicationJson = "application/json"
    static let authorization = "Authorization"
    static let contentType = "Content-Type"
    static let timezone = "timezone"
    static let appversion = "appversion"
    static let plateform = "plateform"
    static let applicationUrlEncoded = "application/x-www-form-urlencoded"
}

struct nexmoUserInfoKey {
    static let nexmo = "nexmo"
    static let body = "body"
    static let text = "text"
    static let pushInfo = "push_info"
    static let fromUser = "from_user"
    static let displayName = "display_name"
    static let conversation = "conversation"
    static let chatNotification = "ChatNotification"
    static let conversationID = "conversation_id"
}

struct AppBundleId {
    static let attendant: String = "com.simformsolutions.tagBAttendant"
    static let enforcement: String = "com.simformsolutions.tagBDemoEnforcement"
}

struct AppleMerchant {
    static let merchantTagBDemoApp: String = "merchant.runparking.com"
}

struct StripPaymentGatewayKeys {
    static let STRIPE_PUBLIC_KEY: String = "pk_test_51KfoBCLkI0EcNiJbqdJVeWgeOcXpAqMF2St5bMCG6E8MzrBBXEi5wRmW6WXGFM50WfnvJPIm60eFYillysAVDzMI00vEEU1wML"
    static let STRIPE_SECRET_KEY: String = "pk_live_51KfoBCLkI0EcNiJbmLYq4XJKFqR1Zm2ymU2eYwi3fHplaJnxubFzkhIHJvKb5W5cSrPKI5bn8pvrPHqiL9QrMnYx00UBFnuT8R"
    static let STRIPE_PUBLIC_KEY_BASE64: String = "pk_test_51KfoBCLkI0EcNiJbqdJVeWgeOcXpAqMF2St5bMCG6E8MzrBBXEi5wRmW6WXGFM50WfnvJPIm60eFYillysAVDzMI00vEEU1wML".toBase64()
    static let STRIPE_SECRET_KEY_BASE64: String = "pk_live_51KfoBCLkI0EcNiJbmLYq4XJKFqR1Zm2ymU2eYwi3fHplaJnxubFzkhIHJvKb5W5cSrPKI5bn8pvrPHqiL9QrMnYx00UBFnuT8R".toBase64()
    
    static func getKey() -> String {
        #if DEBUG
            return StripPaymentGatewayKeys.STRIPE_PUBLIC_KEY
        #else
            return StripPaymentGatewayKeys.STRIPE_SECRET_KEY
        #endif
    }
    
    static func getBase64() -> String {
        #if DEBUG
            return StripPaymentGatewayKeys.STRIPE_PUBLIC_KEY_BASE64
        #else
            return StripPaymentGatewayKeys.STRIPE_SECRET_KEY_BASE64
        #endif
    }
}

struct TermsAndConditions {
    static let stagingURL: String = "https://staging-frontend.runparking.com/termsandcondition"
    static let uatURL: String = "https://uat-frontend.runparking.com/termsandcondition"
    static let prodURL: String = "https://runparking.com/Termsandcondition"
    
    static func getURL() -> String {
#if DEBUG
        return TermsAndConditions.stagingURL
#elseif UAT
        return TermsAndConditions.uatURL
#else
        return TermsAndConditions.prodURL
#endif
    }
    
}

struct AppleUserData {
    public var accessToken: String = ""
    public var fullName: String = ""
    public var givenName: String = ""
    public var familyName: String = ""
    public var email: String = ""
}

struct CardDetails {
    var cardNumber: String
    var cardExpDateYear: String
    var cardCVV: String
    var cardHolderName: String
    var zipCode: String
    var clientSecretToken: String
    var cardType: String
    
    func getExpDate() -> (cardExpDate: String, cardExpYear: String, isError: Bool) {
        guard let date = cardExpDateYear.components(separatedBy: "/").first, let year = cardExpDateYear.components(separatedBy: "/").last else {
            return ("", "", true)
        }
        return(date, year, false)
    }
}

struct ActionTypes {
    static let bookReservation = "bookReservation"
    static let extendReservation = "extendReservation"
    static let citationPayment = "citationPayment"
}

struct APIParams {
    
    struct Authentication {
        static let refreshToken = "refreshToken"
        static let contentType = "Content-Type"
        static let authorization = "Authorization"
        static let email = "email"
        static let password = "password"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let confirmPassword = "confirmPassword"
        static let signUpType = "signup_type"
        static let socialId = "social_id"
        static let mobileNum = "phone"
        static let phoneNumber = "phoneNumber"
        static let userType = "userType"
        static let newsLetterAlert = "newsLetterAlert"
        static let registrationPlatform = "registrationPlatform"
        static let termsAgreement = "termsAgreement"
        static let fullName = "name"
        static let userToken = "token"
        static let platform = "platform"
        static let deviceId = "deviceId"
        static let loginPlatform = "loginPlatform"
        static let deviceToken = "deviceToken"
        static let phoneExtension = "phoneExtension"
        static let businessName = "businessName"
        static let businessAddress = "address"
    }
    
    struct Profile {
        static let address = "address"
        static let city = "city"
        static let state = "state"
        static let zipcode = "zipcode"
        static let country = "country"
        static let updatedEmail = "updatedEmail"
        static let newEmail = "newEmail"
        static let verificationCode = "code"
        static let otp = "otp"
        static let phoneExtension = "phoneExtension"
        static let photo = "photo"
        static let businessName = "businessName"
        static let isProfilePhotoDelete = "isProfilePhotoDelete"
    }
    
    struct ChangePassword {
        static let currentPassword = "currentPassword"
        static let password = "password"
        static let confirmPassword = "confirmPassword"
    }
    
    struct AddVehicle {
        static let id = "id"
        static let vehicleId = "vehicleId"
        static let vehicleType = "vehicleType"
        static let nickName = "nickName"
        static let carMake = "carMake"
        static let model = "model"
        static let year = "year"
        static let color = "color"
        static let licensePlateState = "licensePlateState"
        static let licensePlateNumber = "licensePlateNumber"
        static let country = "country"
        static let isVehicleOversized = "isVehicleOversized"
        static let isPrimary = "isPrimary"
        static let stateCode = "stateCode"
        static let driver = "driver"
        static let vehicleData = "vehicleData"
        static let isOversizedVehicle = "isVehicleOversized"
    }
    
    struct Driver {
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let email = "isVehicleOversized"
        static let mobile = "isPrimary"
        static let phoneExtension = "phoneExtension"
    }
    
    struct NotificationPreferances {
        static let recurringBillAlert = "recurringBillAlert"
        static let timeRemainingAlert = "timeRemainingAlert"
        static let expirationReminderMinutes = "expirationReminderMinutes"
        static let emailNotificationOnStart = "emailNotificationOnStart"
        static let emailExpirationReminder = "emailExpirationReminder"
        static let emailNotificationOnEnd = "emailNotificationOnEnd"
        static let textNotificationOnStart = "textNotificationOnStart"
        static let textExpirationReminder = "textExpirationReminder"
        static let textNotificationOnEnd = "textNotificationOnEnd"
        static let recurringBillEmailAlert = "recurringBillEmailAlert"
        static let recurringBillTextAlert = "recurringBillTextAlert"
        static let recurringBillNotificationReminderDays = "recurringBillNotificationReminderDays"
    }
    
    struct ParkingDetails {
        static let reservationPassId = "reservationPassId"
        static let searchString = "searchString"
        static let entryAfter = "entryAfter"
        static let exitBefore = "exitBefore"
        static let startTime = "startTime"
        static let endTime = "endTime"
        static let start = "start"
        static let end = "end"
        static let singleSpace = "singleSpace"
        static let spaceCount = "spaceCount"
        static let searchMode = "searchMode"
        static let parkingId = "id"
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let eventDate = "eventDate"
        static let parkingLotId = "parkingLotId"
        static let currentDate = "currentDate"
        static let currentTime = "currentTime"
        static let specificParkingLotId = "specificParkingLotId"
        static let boundaryLatitude = "boundaryLatitude"
        static let boundaryLongitude = "boundaryLongitude"
        static let currentDateTime = "currentDateTime"
        static let reservationId = "reservationId"
        static let amenities = "amenities"
        static let sortBy = "sortBy"
    }
    
    struct AddParkingRating {
        static let ratings = "ratings"
        static let comment = "comment"
        static let parkingLotId = "parkingLotId"
        static let reservationId = "reservationId"
        static let reservationPassId = "reservationPassId"
    }
    
    struct Logout {
        static let refreshToken = "refreshToken"
    }
    
    struct Message {
        static let problemType = "type"
    }
    
    struct ProblemsType {
        static let userClosingAccountFeedback = "user_closing_account_feedback"
    }
    
    struct ReservationList {
        static let currentDateTime = "currentDateTime"
        static let reservationListType = "reservationListType"
        static let reservationType = "reservationType"
        static let startDate = "startDate"
        static let endDate = "endDate"
        static let status = "status"
        static let fromDate = "fromDate"
        static let toDate = "toDate"
        static let isBusiness = "isBusiness"
        static let reservationHistory = "reservationHistory"
        static let slotType = "slotType"
        static let useOnlyWallet = "useOnlyWallet"
        static let useWallet = "useWallet"
    }
    
    struct RaiseQuery {
        static let reservationId = "reservationId"
        static let problem = "problem"
        static let description = "description"
        static let attachedFiles = "attachedFiles"
        static let files = "files"
        static let reason = "reason"
        static let refundIn = "refundIn"
        static let currentDate = "currentDateTime"
    }
    
    struct PromoCode {
        static let promocode = "promocode"
    }
    
    struct Payment {
        static let paymentNonce = "paymentNonce"
        static let token = "token"
        static let fromDate = "fromDate"
        static let toDate = "toDate"
        static let parkingLotId = "parkingLotId"
        static let baseAmount = "baseAmount"
        static let serviceCharge = "serviceCharge"
        static let vehicleId = "vehicleId"
        static let reservationType = "reservationType"
        static let entryAfter = "entryAfter"
        static let exitBefore = "exitBefore"
        static let endTime = "endTime"
        static let startTime = "startTime"
        static let spaceCount = "spaceCount"
        static let paymentToken = "paymentToken"
        static let promoCodeId = "promoCodeId"
        static let citationId = "citationId"
        static let refundAmount = "refundAmount"
        static let pageNumber = "pageNumber"
        static let type = "type"
        static let discount = "discount"
        static let useWallet = "useWallet"
        static let reservations = "reservations"
        static let isBusiness = "isBusiness"
        static let business = "business"
        static let isMultipleSpace = "isMultipleSpace"
        static let group = "group"
        static let fleet = "fleet"
        static let slotName = "slotName"
        static let tax = "tax"
        static let isFromExtendReservation = "isFromExtendReservation"
        static let spaceNumber = "spaceNumber"
        static let categoryName = "categoryName"
        static let transactionId = "transactionId"
        static let paymentMethod = "paymentMethod"
        static let updatedSpaceNumber = "updatedSpaceNumber"
        static let actionType = "actionType"
        static let updatedSlotName = "updatedSlotName"
    }
    
    struct PreviewReservation {
        static let reservationId = "reservationId"
        static let entryAfter = "entryAfter"
        static let exitBefore = "exitBefore"
        static let startTime = "startTime"
        static let endTime = "endTime"
        static let isFromExtendReservation = "isFromExtendReservation"
        static let reservationPassId = "reservationPassId"
    }
    
    struct Download {
        static let timeZoneRegion = "timeZoneRegion"
        static let createdBy = "createdBy"
        static let paymentId = "paymentId"
    }
    
    struct AddValet {
        static let keyBoxNumber = "keyBoxNumber"
        static let valetName = "workerName"
        static let assignedSpace = "assignedSpace"
        static let keyAvailable = "keyAvailable"
        static let leftImage = "leftImage"
        static let rightImage = "rightImage"
        static let rearImage = "rearImage"
        static let frontImage = "frontImage"
        static let images = "image"
        static let imageTiming = "imageTiming"
        static let reservationID = "reservationId"
        static let date = "date"
    }
    
    struct AttendantRequest {
        static let parkingLotId = "parkingLotId"
        static let startingCash = "startingCash"
        static let whereCashDeposited = "whereCashDeposited"
        static let whereCashSubmitName = "whereCashSubmitName"
        static let cashDeposited = "cashDeposited"
        static let totalCash = "totalCash"
        static let differenceReason = "differenceReason"
        static let breakTimeHours = "breakTimeHours"
        static let breakTimeMinutes = "breakTimeMinutes"
        static let isAttendant = "isAttendant"
        static let isValet = "isValet"
        static let faceId = "faceId"
        static let touchId = "touchId"
        static let darkTheme = "darkTheme"
        static let notification = "notification"
        static let workingAs = "workingAs"
        static let keyLogID = "id"
        static let keyStatus = "keyStatus"
        static let rentalID = "rental_id"
        static let rentalIdSendPayment = "rentalId"
        static let userId = "userId"
        static let status = "status"
        static let start = "start"
        static let end = "end"
        static let currentDateTime = "currentDateTime"
        static let reservationListType = "reservationListType"
        static let sourceCompanyName = "sourceCompanyName"
        static let parkingLotName = "parkingLotName"
        static let currentDate = "currentDate"
        static let startTime = "startTime"
        static let endTime = "endTime"
        static let image = "image"
        static let reservationNumber = "reservationNumber"
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let date = "date"
        static let from = "from"
        static let to = "to"
        static let reservationId = "reservationId"
        static let reservationIds = "reservationIds"
        static let licensePlateNumber = "license_plate"
        static let licensePlateNo = "licensePlateNumber"
        static let timeToExpire = "timeToExpire"
        static let carMake = "carMake"
        static let model = "model"
        static let entryAfter = "entryAfter"
        static let exitBefore = "exitBefore"
        static let licensePlate = "license_plate"
        static let baseAmount = "baseAmount"
        static let email = "email"
        static let phone = "phone"
        static let reservationType  = "reservationType"
        static let paymentToken = "paymentToken"
        static let paymentNonce = "paymentNonce"
        static let paymentMethod = "paymentMethod"
        static let userType = "userType"
        static let dateTime = "dateTime"
        static let valetReservationParkingLogId = "valetReservationParkingLogId"
        static let esTimatedTimeToReady = "estimatedTimeToReady"
        static let message = "message"
        static let phoneCountryCode = "phoneCountryCode"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let roomNumber = "roomNumber"
        static let stateCode = "stateCode"
        static let attendant = "attendant"
        static let valet = "valet"
        static let bookingNumber = "bookingNumber"
        static let reservationPassId = "reservationPassId"
        static let key = "key"
        static let imageName = "imageName"
        static let actionTaken = "actionTaken"
        static let amount = "amount"
        static let serviceCharge = "serviceCharge"
        static let parkingSpaceNumber = "parkingSpaceNumber"
        static let slotName = "slotName"
        static let rentalId = "rentalId"
        static let actionTakenId = "actionTakenId"
        static let citationNote = "citationNote"
        static let fineAmount = "fineAmount"
        static let lotNumber = "lotNumber"
        static let violation = "violation"
        static let otherViolation = "otherViolation"
        static let violationId = "violationId"
        static let citationId = "citationId"
        static let notificationType = "notificationType"
        static let unbootReason = "unbootReason"
        static let paymentStatus = "paymentStatus"
        static let toDate = "toDate"
        static let fromDate = "fromDate"
        static let isUnbooted = "isUnbooted"
        static let isBusiness = "isBusiness"
        static let businessReservationId = "businessReservationId"
        static let reservationPaasId = "reservationPassId"
        static let bootNumber = "bootNumber"
        static let userChatId = "userChatId"
        static let userName = "userName"
        static let userRole = "userRole"
        static let userChatIds = "userChatIds"
        static let userNames = "userNames"
        static let isGroup = "isGroup"
        static let conversationId = "conversationId"
        static let conversationIds = "conversationIds"
        static let profileUserChatId = "profileUserChatId"
        static let blockedUserChatId = "blockedUserChatId"
        static let name = "name"
        static let profileImage = "profileImage"
        static let excludedChatUserIds = "excludedChatUserIds"
        static let parkingZoneAddress = "parkingZoneAddress"
        static let notifyType = "notifyType"
        static let isValetAdded = "isValetAdded"
        static let voidCitationReason = "voidCitationReason"
        static let messageTitle = "messageTitle"
        static let userIds = "userIds"
        static let validationOrderPassId = "validationOrderPassId"
        static let validationOrderPassIds = "validationOrderPassIds"
        static let bankName = "bankName"
        static let bankAddress = "bankAddress"
        static let bookingType = "bookingType"
        static let allowAddValet = "allowAddValet"
        static let allowAddRequestQueue = "allowAddRequestQueue"
        static let validate = "Validate"
        static let documents = "documents"
        static let instituteUserId = "instituteUserId"
        static let isAllParkingLots = "isAllParkingLots"
        static let reservationPassIds = "reservationPassIds"
        static let reservedEventPassId = "reservedEventPassIds"
        static let institutePassIds = "institutePassIds"
        static let reasonForKeyNotAvailable = "reasonForKeyNotAvailable"
        static let oversizeVehicleTypeId = "oversizeVehicleTypeId"
        static let partialTicketReservationId = "partialTicketReservationId"
        static let userDetail = "userDetail"
        static let vehicleDetail = "vehicleDetail"
        static let ticketReservationId = "ticketReservationId"
        static let dateFrom = "dateFrom"
        static let dateTo = "dateTo"
        static let leaveStatus = "leaveStatus"
        static let leaveStartDate = "leaveStartDate"
        static let leaveEndDate = "leaveEndDate"
        static let leaveReason = "leaveReason"
        static let licensePlateImage = "licensePlateImage"
    }
    
    struct FleetVehicleList {
        static let parkingLotId = "parkingLotId"
        static let type = "type"
        static let vehicleStatus = "vehicleStatus"
        static let searchString = "searchString"
        static let filterStatus = "status"
        static let filterColor = "color"
        static let filterStartDate = "startDate"
    }
    
    struct DeactivateVehicle {
        static let vehicleId = "vehicleId"
        static let deActivateDate = "deActivate"
        static let deActivateTemporary = "deActivateTemporary"
        static let removeVehicle = "removeVehicle"
        static let reActivate = "reActivate"
        static let feedback = "feedback"
    }
    
    struct UserStatusUpdate {
        static let actionDate = "actionDate"
        static let parkingLotId = "parkingLotId"
        static let status = "status"
        static let userId = "userId"
        static let isTemporary = "isTemporary"
        static let reservationPassId = "reservationPassId"
        static let reservationId = "reservationId"
    }
    
    struct GroupVehicleEdit {
        static let vehicleId = "id"
        static let carMake = "carMake"
        static let model = "model"
        static let year = "year"
        static let color = "color"
        static let licensePlateState = "licensePlateState"
        static let licensePlateNumber = "licensePlateNumber"
        static let country = "country"
        static let parkingLotId = "parkingLotId"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let email = "email"
        static let employeeId = "employeeId"
        static let department = "department"
        static let jobTitle = "jobTitle"
        static let phone = "phone"
        static let phoneExtension = "phoneExtension"
        static let stateCode = "stateCode"
    }

    struct MultipleSpacePrice {
        static let parkingLotId = "parkingLotId"
        static let reservationType = "reservationType"
        static let reservations = "reservations"
        static let promocode = "promocode"
    }

    struct ShareLink {
        static let reservationPassUrl = "reservationPassUrl"
        static let email = "email"
        static let vehicleSpaceType = "vehicleSpaceType"
    }
    
    struct ReportAnIssue {
        static let parkingLotId = "parkingLotId"
        static let issueCategoryId = "issueCategoryId"
        static let issueDescription = "issueDescription"
        static let issuedDate = "issuedDate"
        static let images = "images"
        static let supervisorId = "supervisorId"
        static let otherIssue = "otherIssue"
    }
    
    struct DisputeCitationRequest {
        static let citationId = "citationId"
        static let userId = "userId"
        static let disputeReason = "disputeReason"
        static let disputeImages = "disputeImages"
        static let userEmail = "userEmail"
    }
    
    struct StripeAddCard {
        static let cardNumber = "card[number]"
        static let cardHolderName = "card[name]"
        static let cardExpYear = "card[exp_year]"
        static let cardExpMonth = "card[exp_month]"
        static let cardCVVNum = "card[cvc]"
        static let source = "source"
        static let type = "type"
        static let metaData = "metadata[cardType]"
    }
    
    struct ClientSecret {
        static let totalAmount = "totalAmount"
        static let serviceCharge = "serviceCharge"
        static let parkingLotId = "parkingLotId"
        static let reservationId = "reservationId"
        static let citationId = "citationId"
    }
    
    struct AddressFilter {
        static let country = "country"
        static let state = "state"
    }
    
    struct ValidateInstituteMember {
        static let clientId = "clientId"
        static let instituteUserId = "instituteUserId"
        static let memberId = "memberId"
        static let otp = "otp"
    }
    
    struct InstituteRefundRequest {
        static let refundReason = "refundReason"
        static let payrollTransactionIds = "payrollTransactionIds"
        static let leaveCancelReason = "leaveCancelReason"
    }
    
    struct AskForReason {
        static let startDate = "startDate"
        static let endDate = "endDate"
        static let reason = "reason"
        static let cancelReason = "cancelReason"
    }
    
    struct TransferRequest {
        static let clientId = "clientId"
        static let parkingLotIds = "parkingLotIds"
        static let transferDate = "transferDate"
    }
}

struct DBConstants {
    static let dbFileName = "Demo"
    static let separator = ", "
    static let imageDirectory = "Images"
    static let databaseDirectory = ".Database"
}

struct DBTables {
    static let ConversationList            = "ConversationList"
    static let UserList                    = "UserList"
    static let RecentMessageList           = "RecentMessageList"
}

struct DBColumns {
    static let roleName                 = "roleName"
    static let roleId                   = "roleId"
    static let isCustomerRole           = "isCustomerRole"
    static let orderNo                  = "orderNo"
    static let isSynced                 = "isSynced"
    static let totalCount               = "totalCount"
    static let closedCount              = "closedCount"
    static let operationId              = "operationId"
    static let operationName            = "operationName"
    static let tagIds                   = "tagIds"
    static let name                     = "Name"
}

