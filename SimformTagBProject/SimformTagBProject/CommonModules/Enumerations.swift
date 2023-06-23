//
//  Enumerations.swift
//  TagBDemo
//
//  Created by Ami Solani on 12/10/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit

//Bundle given in brain tree
enum BrainTreeBundle: String {
    case bundleName = "com.simformsolutions.tagBDemoApp.payments"
}

//curreny
enum Currency: String {
    case USD
    case GBP
    case EUR
    
    var symbol: String {
        switch self {
        case .USD: return "$"
        case .GBP: return "£"
        case .EUR: return "€"
        }
    }
}

// Validation regex
public enum RegexType: String {
    case emailValid = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case phoneNumberValid = "+0123456789"
    case password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,16}"
}

enum UserType {
    case personal
    case business
    
    var rawValue: String {
        switch self {
        case .personal:
            return AppString.individual()
        case .business:
            return AppString.business()
        }
    }
    
}

enum ResetPassowrdType {
    case email
    case phone
}

/// App Font
enum AppFonts: Int {
    
    case poppinsRegular = 0
    case poppinsMedium = 1
    case poppinsSemiBold = 2
    case poppinsBold = 3
    
    func getFont(withSize size: CGFloat = 18) -> UIFont {
        switch self {
        case .poppinsRegular: return AppFont.poppinsRegular(size: size) ?? setRegularSystemFont(size: size)
        case .poppinsMedium: return AppFont.poppinsMedium(size: size) ?? setMediumSystemFont(size: size)
        case .poppinsSemiBold: return AppFont.poppinsSemiBold(size: size) ?? setSemiBoldSystemFont(size: size)
        case .poppinsBold: return AppFont.poppinsBold(size: size) ?? setBoldSystemFont(size: size)
        }
    }
}

/// loading state
enum LodingState {
    case loading
    case empty
    case failure
    case success
}

public enum SegementType: Int {
    case normal = 0, imageOnTop, onlyImage
}

public enum SelectorType: Int {
    case normal = 0, bottomBar
}

/// Basebutton options
enum BaseButtonOptions: String {
    case appBtnWithMediumFont
    case appBtnWithRegularFont
    case appBtnWithWhiteFontColor
    case whiteBtnWithWhiteBorder
    case whiteBtnWithAppColorFont
    case whiteBtnWithAppColorFontWithMediumFont
    case whiteBtnWithBlackColorFont
    case whiteBtnWithBlackColorFontWithBorder
    case blackBtnWithWhiteFont
    case blackBtnWithWhiteFontWithMediumFont
    case redBtnWithWhiteFont
    case clearBtnWithAppColorFontWithMediumFont
    case clearBtnWithWhiteColorFontWithMediumFontWithWhiteBorder
    case clearBtnWithBlackColorFontWithMediumFont
    case clearBtnWithAppColorFontWithMediumFontWithDashedBorder
    case baseBtn
    case navigationBarButtonWithWhiteFont
    case appBtnWithSemiBoldFont
    case clearBtnWithBlackColorFontWithMediumFontWithBlackBorder
    
    var typeIntValue: Int {
        switch self {
        case .appBtnWithMediumFont:
            return 0
        case .appBtnWithRegularFont:
            return 1
        case .appBtnWithWhiteFontColor:
            return 2
        case .whiteBtnWithWhiteBorder:
            return 3
        case .whiteBtnWithAppColorFont:
            return 4
        case .whiteBtnWithAppColorFontWithMediumFont:
            return 5
        case .whiteBtnWithBlackColorFont:
            return 6
        case .whiteBtnWithBlackColorFontWithBorder:
            return 7
        case .blackBtnWithWhiteFont:
            return 8
        case .blackBtnWithWhiteFontWithMediumFont:
            return 9
        case .redBtnWithWhiteFont:
            return 10
        case .baseBtn:
            return 11
        case .clearBtnWithAppColorFontWithMediumFont:
            return 12
        case .clearBtnWithWhiteColorFontWithMediumFontWithWhiteBorder:
            return 13
        case .clearBtnWithBlackColorFontWithMediumFont:
            return 14
        case .clearBtnWithAppColorFontWithMediumFontWithDashedBorder:
            return 15
        case .navigationBarButtonWithWhiteFont:
            return 16
        case .appBtnWithSemiBoldFont:
            return 17
        case .clearBtnWithBlackColorFontWithMediumFontWithBlackBorder:
            return 18
        }
    }
    
}

// Image Type declaration
public enum FileType: String {
    case png = ".png"
    case image = "image/png"
    case gif = "gif"
    case mp4 = "mp4"
}

enum DateFormat: String {
    case date = "dd-MM-yyyy"
    case reverseDate = "yyyy-MM-dd"
    case dateWithSpace = "MMM dd, yyyy"
    case dateAndMonth = "MMM dd"
    case dateAndTime = "MMM dd, yyyy-hh:mm a"
    case dateAndTimeWithSec = "MMM dd, yyyy-hh:mm:ss a"
    case dateAndTimeFormat = "yyyy-MM-dd,HH:mm:ss"
    case enUSDateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    case apiDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    case dateAndTimeAndSecFormat = "yyyy-MM-dd HH:mm:ss'+'00"
    case time = "hh:mm a"
    case dateFormatMMddYYYY = "MM/dd/yyyy"
    case apiTime = "HH:mm:ss"
    case localDateTimeFormat = "yyyy-MM-dd HH:mm:ss '+'0000"
    case dateddMMyyyy = "dd/MM/yyyy"
}

enum MenuAnimationType {
    case slideIn
    case slideOut
    case compress(CGFloat, CGFloat)
}

enum MenuCellType {
    case defaultStyle
    case customStyle
}

enum PromoCodeType: String {
    case absolute
    case percentage
}

enum SideMenuPlacement {
    case left
    case right
}

enum VehicleRegularOversizeType: String {
    case regular = "Regular"
    case oversizedRegular = "Oversized_Regular"
    case other = "other"
    
    var value: String {
        switch self {
        case .regular:
            return AppString.regularVehicle()
        case .oversizedRegular:
            return AppString.oversizedVehicle()
        case .other:
            return AppString.other()
        }
    }
}

enum TaxType: String {
    case inclusiveTax = "in"
    case exclusiveTax = "ex"
}

enum actionTakenOnReservationBooking: String {
    case change = "change"
    case noChange = "no-change"
    case delete = "delete"
}

enum PaymentHistoryType: String {
    case reservation = "reservation"
    case transaction = "transaction"
}

enum SideMenuDimensions: CGFloat {
    case rowHeight
    case leftIconPadding
    case imageToTitlePadding
    case imageHeight
    case imageWidth
    case compressMultiplier
    case imageCornerRadius
    case menuWidthMultiplier
    case shadowRadius
    case shadowOpacity
    
    var rawValue: CGFloat {
        switch self {
        case .rowHeight:
            return 40
        case .leftIconPadding:
            return 20
        case .imageToTitlePadding:
            return 10
        case .imageHeight:
            return 24
        case .imageWidth:
            return 24
        case .compressMultiplier:
            return 0.7
        case .imageCornerRadius:
            return 30
        case .menuWidthMultiplier:
            return 0.7
        case .shadowRadius:
            return 30
        case .shadowOpacity:
            return 1.0
        }
    }
    
}


enum LoginType: String {
    case facebook = "facebook"
    case google = "google"
    case apple = "apple"
    case manual = "email"
}

/// Social Login Type with user data
enum SocialLoginType {
    
    case google(_ userData: GoogleUserData)
    case facebook(_ userData: FBUserData)
    case apple(_ userData: AppleUserData)
    
    /// String description for case
    var description: String {
        switch self {
        case .facebook(_):
            return "facebook"
        case .google(_):
            return "google"
        case .apple(_):
            return "apple"
        }
    }
    
}

enum KeychainKeys: String {
    case familyNameKey = "familyName"
    case givenNameKey = "givenName"
    case emailIdKey = "email"
}

enum SelectorButtonType: Int {
    case normal
    case oversized
}

enum VehicleType: String {
    case normal = "regular"
    case oversized = "oversize"
}

enum DeactivateUserType: Int {
    case temporary
    case permanently
}

enum SpaceType: Int {
    case single
    case multiple
}

/// for defining cell style whether its rounded from top left right or bottom left right or round all corners
enum CellType: String {
    case roundTopLeftRight
    case roundBottomLeftRight
    case roundAll
    case none
}

enum ParkingNotification: Int {
    case remainingTime
    case alertExpiration
    case billRecur
    case recurringBill
}

enum EmailTextNotification: Int {
    case startSession
    case remaining15Min
    case endSessions
    case recurringBill
}

enum NotificationType: Int {
    case parking
    case email
    case text
}

enum SearchBarOption: Int {
    case home
    case cancelReservation
}

enum PaymentDetailsHeader {
    case transactionDetails
    case paymentDetails
    
    var value: String {
        switch self {
        case .transactionDetails:
            return AppString.transactionDetails()
        case .paymentDetails:
            return AppString.paymentDetails()
        }
    }
    
    var intValue: Int {
        switch self {
        case .transactionDetails:
            return 0
        case .paymentDetails:
            return 1
        }
    }
}

enum ReservationType: String {
    case current = "current"
    case upcoming = "upcoming"
    case past = "past"
    case partial = "partial"
}

enum Status: String {
    case active = "active"
    case inActive = "in-active"
    case expired = "expired"
}

enum AppTimeZone {
    case current
    case utc
}

enum CMSPages {
    case help
    case termsCondition
    case privacyPolicy
}

enum DashedViewDimensions {
    case cornerRadius
    case dashWidth
    case dashColor
    case dashLength
    case betweenDashesSpace
    case unauthorisedTableCellCornerRadius
    
    var value: CGFloat {
        switch self {
        case .cornerRadius:
            return 10
        case .dashWidth:
            return 1
        case .dashLength:
            return 5
        case .betweenDashesSpace:
            return 4
        case .unauthorisedTableCellCornerRadius:
            return 8
        default:
            return 0
        }
    }
    
    var color: UIColor {
        switch self {
        case .dashColor:
            return AppColor.backgroundColor() ?? .green
        default:
            return UIColor()
        }
    }
}

enum PaymentType: Int {
    case card
    case applePay
    case googlePay
    case payPal
}

/// Mime Type
enum MimeType: String {
    case pngMimeTypeImage = "image/png"
    case jpegMimeTypeImage = "image/jpeg"
    case applicationJSON = "application/json"
}

enum PaymentMethodType: Int {
    case card = 0
    case applePay
    case googlePay
    case payPal
    case venmo
    case none
}

enum ParkingReceipt {
    case receipt
    case steps
    case parkingInfo
    case reservationInfo
    case paymentInfo
    case stepsInfo
    
    var indexValue: Int {
        switch self {
        case .receipt:
            return 0
        case .steps:
            return 1
        case .parkingInfo:
            return 2
        case .reservationInfo:
            return 3
        case .paymentInfo:
            return 4
        case .stepsInfo:
            return 5
        }
    }
}

enum BusinessReceipt: Int {
    case receiptParkingInfo
    case receiptReservations
    case receiptPaymentInfo
    case steps
}

enum BusinessReservationSections: Int {
    case reservation
    case parkingInfo
    case passInfo
    case reservationInfo
    case paymentInfo
    case upcomingReservationInfo
    case upcomingPaymentInfo
    case remainingTime
    
    var indexValue: Int {
        switch self {
        case .reservation:
            return 0
        case .parkingInfo:
            return 1
        case .passInfo:
            return 2
        case .reservationInfo:
            return 3
        case .paymentInfo:
            return 4
        case .remainingTime:
            return 5
        case .upcomingReservationInfo:
            return 6
        case .upcomingPaymentInfo:
            return 7
        }
    }
}

enum BaseTableViewDimensions {
    case spacerLabelHeight
    case descriptionPriority
    case stackPlaceholderWidth
    case stackPlaceholderHeight
    case betweenDashesSpace
    case numberOfLines
    case btnEmptyPriority
    case btnEmptyHeight
    
    var value: CGFloat {
        switch self {
        case .spacerLabelHeight:
            return 30
        case .stackPlaceholderWidth:
            return 32
        case .stackPlaceholderHeight:
            return 40
        case .btnEmptyHeight:
            return 40
        default:
            return 0
        }
    }
    
    var contentHuggingPriority: Float {
        switch self {
        case .descriptionPriority:
            return 248
        case .btnEmptyPriority:
            return 251
        default:
            return 250
        }
    }
    
    var lines: Int {
        switch self {
        case .numberOfLines:
            return 2
        default:
            return 0
        }
    }
    
}

enum Amenities: String {
    case evCharging = "ev charging"
    case opSpotParking = "op-spot-parking"
    case valet = "valet"
    
    var amenitiesImage: UIImage {
        switch self {
        case .evCharging:
            return UIImage(named: AppImage.rooftop.name) ?? UIImage()
        case .opSpotParking:
            return UIImage(named: AppImage.nightParking.name) ?? UIImage()
        case .valet:
            return UIImage(named: AppImage.enforcement.name) ?? UIImage()
        }
    }
}

enum ParkingReservationType {
    case daily
    case monthly
    case event
    case validation
    case reservationPass
    
    var value: String {
        switch self {
        case .daily:
            return "Daily"
        case .monthly:
            return "Monthly"
        case .event:
            return "Event"
        case .validation:
            return "Validation"
        case .reservationPass:
            return "Reservation Pass"
        }
    }
    
    var apiValue: String {
        switch self {
        case .daily:
            return "daily"
        case .monthly:
            return "monthly"
        case .event:
            return "event"
        case .validation:
            return "validation"
        case .reservationPass:
            return "reservationPass"
        }
    }    
}

enum UpdateReceiptInfo: Int {
    case updateStartDate
    case updateEndDate
    case updateVehicle
    case updateMonthlyStartDate
    case none
}

enum filterScreenVia {
    case regular
    case citation
}

enum CitationStatus {
    case paid
    case unpaid
    case all
    case disputed
    case void
    case waivePenalty
    
    var value: String {
        switch self {
        case .all:
            return "All"
        case .paid:
            return "Paid"
        case .unpaid:
            return "Unpaid"
        case .disputed:
            return "Disputed"
        case .void:
            return "Void"
        case .waivePenalty:
            return "Waive Penalty"
        }
    }
    
    var filterValue: String {
        switch self {
        case .paid:
            return "Paid"
        case .unpaid:
            return "Unpaid"
        case .disputed:
            return "Disputed"
        case .void:
            return "Void"
        case .waivePenalty:
            return "waivePenalty"
        case .all:
            return "All"
        }
    }
    
}

enum SortType {
    case closest
    case cheapest
    
    var value: String {
        switch self {
        case .closest: return "close"
        case .cheapest: return "cheap"
        }
    }
}

enum ParkingDetailEditButton: Int {
    case dailyStartTimeEdit
    case dailyEndTimeEdit
    case monthlyStartTimeEdit
}

//Raview parking Info segment In parking Location Detail
enum parkingRating: Int {
    case parkingInfo = 0
    case timing = 1
    case ratings = 2
}

// Card type
enum CardType: String {
    case amex = "AMEX"
    case other = "OTHER"
    case cardTextFieldPrefix = "37"
}

// For textfiled validation
public enum CardNumbers: Int {
    case cardNumberWithoutSpaces = 19
    case indexCard4 = 4
    case indexCard10 = 10
    case indexCard15 = 15
    case indexCard16 = 16
    case digitSum9 = 9
    case digitSum8 = 8
    case digitSum2 = 2
    case digitSum6 = 6
    case digitSum17 = 17
}

enum DiscountType: String {
    case percentage = "percentage"
    case flat = "flat"
}

enum paymentMethods: String {
    case credit_card = "credit_card"
    case paypal_account = "paypal_account"
    case android_pay_card = "googlePay"
    case apple_pay_card = "applePay"
    case wallet = "wallet"
    case promocode = "promocode"
    case cash = "cash"
    case sms = "sms"
    case card = "card"
    
    var value: String {
        switch self {
        case .credit_card, .card:
            return "Card"
        case .paypal_account:
            return "Paypal Account"
        case .android_pay_card:
            return "Google Pay"
        case .apple_pay_card:
            return "Apple Pay"
        case .wallet:
            return "Wallet"
        case .promocode:
            return AppString.usedPromoCode()
        case .cash:
            return "Cash"
        case .sms:
            return "SMS"
        }
    }
}

enum NotificationTypeForCustomer: String {
    case bookingStatus = "Notify booking status"
    case paymentReminder = "Send payment reminder"
    case parkingLotStatus = "Parking lot will close now so please get your vehicle once parking lot opens."
    case Other = "Other"
    
    var value: String {
        switch self {
        case .bookingStatus:
            return "bookingStatus"
        case .paymentReminder:
            return "paymentReminder"
        case .parkingLotStatus:
            return "parkingLotStatus"
        case .Other:
            return "Other"
        }
    }
}

enum PaymentMethods: String {
    case creditCard = "card"
    case paypalAccount = "paypal_account"
    case androidPayCard = "android_pay_card"
    case applePayCard = "apple_pay_card"
    case wallet = "wallet"
    case promoCode = "promocode"
    case sms = "sms"
    case cash = "cash"
    case credit = "credit"
    case payLater = "payLater"
    case validationUser = "validationUser"
    case chargeToRoom = "chargeToRoom"
    case creditDebitCard = "credit/debit card"
    case payRoll = "payRoll"
    case applePay = "applePay"
    
    var value: String {
        switch self {
        case .creditCard, .credit:
            return "Card"
        case .paypalAccount:
            return "Paypal Account"
        case .androidPayCard:
            return "Google Pay"
        case .applePayCard:
            return "Apple Pay"
        case .wallet:
            return "Wallet"
        case .sms:
            return "SMS"
        case .promoCode:
            return AppString.usedPromoCode()
        case .cash:
            return "Cash"
        case .payLater:
            return "Pay Later"
        case .validationUser:
            return "Validation User"
        case .chargeToRoom:
            return "charge to room"
        case .creditDebitCard:
            return "credit"
        case .payRoll:
            return "Payroll"
        case .applePay:
            return "Apple Pay"
        }
    }
    
    var apiValue: String {
        switch self {
        case .creditCard, .credit:
            return "Card"
        case .paypalAccount:
            return "Paypal Account"
        case .androidPayCard:
            return "Google Pay"
        case .applePayCard:
            return "Apple Pay"
        case .wallet:
            return "Wallet"
        case .sms:
            return "SMS"
        case .promoCode:
            return AppString.usedPromoCode()
        case .cash:
            return "Cash"
        case .payLater:
            return "pay later"
        case .validationUser:
            return "Validation User"
        case .chargeToRoom:
            return "charge to room"
        case .creditDebitCard:
            return "credit"
        case .payRoll:
            return "Payroll"
        case .applePay:
            return "Apple Pay"
        }
    }
}

enum ReasonType: String {
    case problem = "problem"
    case cancellationReason = "cancellation_reason"
    case currentBookingCancellationReason = "current_monthly_cancellation_reason"
    case removeFleetVehicle = "remove_fleet_vehicle"
}

enum RefundIn: String {
    case wallet = "wallet"
    case payment_method = "payment_method"
}

enum RefundPaymentMethods: String {
    case originalPaymentMethod
    case runParkingBalance
    
    var value: String {
        switch self {
        case .originalPaymentMethod:
            return "Original Payment Method"
        case .runParkingBalance:
            return "Balance"
        }
    }
}

enum BiometricType {
    case none
    case touchID
    case faceID
}

enum ReceivedNotificationType: String {
    case bookingSuccess = "1.1"
    case cancelBooking = "1.2"
    case extendBooking = "1.3"
    case editBooking = "1.4"
    case bookingExpire = "1.5"
    case reservationPass = "1.6"
    case upcomingBookingReminder = "1.7"
    case citationPaymentSuccess = "2.1"
    case citationPaymentFail = "2.2"
    case monthlyCurrentCancelled = "2.3"
    case citationDueDate = "3.1"
    case bookingSessionExpiredNotification = "9.4"
    case bookingExpiredNotification = "9.2"
    case userCitation = "7.1"
    case bookingExpired = "4.2"
    case bookingStarted = "9.3"
}

enum AttendantValetNotificationType: String {
    case checkInSuccess = "1.1"
    case checkoutSuccess = "1.2"
    case breaktime = "1.3"
    case bookingSuccess = "2.1"
    case externalSuccess = "2.2"
    case expireBooking = "2.3"
    case valetAddedSuccess = "3.1"
    case requestQueueStatusUpdate = "4.1"
    case paymentSuccess = "2.4"
    case autoCheckoutWarning = "4.2"
    case autoCheckout = "4.6"
    case notifySuccessfulPayment = "6.5"
    case blockChat = "7.1"
    case unBlockChat = "7.2"
    case newUserJoined = "7.3"
    case requestQueueCountUpdate = "2.5"
}

enum EnforcerNotificationType: String {
    case checkIn = "1.1"
    case checkout = "1.2"
    case breakTime = "1.3"
    case notifyBeforeFiveMins = "1.4"
    case automaticCheckout = "1.5"
    case createCitation = "2.1"
    case expiredBooking = "3.1"
    case ReportedViolationFromAttendant = "3.2"
    case issueReportedSuccessfully = "4.1"
    case unBootCar = "5.1"
    case chat = "6.1"
    case newUserJoined = "7.3"
    case enforcerNewMessage = "7.4"
}

enum EnforcerTab: Int {
    case home = 0
    case verify = 1
    case report = 2
}

enum EnforcerCitationTableCell: Int {
    case details = 0
    case activityHistory = 1
    case actionButtonStack = 2
}

enum Tabs: Int {
    case home
    case reservation
    case myAccount
}

enum PaymentMethodCardType: String {
    case personal
    case business
}

// Attendant Module
enum AttendantHomeType: Int {
    case markAttendance
    case timeSheet
}

enum BookingTypeAttendant: Int {
    case parkingSpace
    case upcoming
    case current
    case expired
    
    var value: String {
        switch self {
        case .parkingSpace:
            return ""
        case .upcoming:
            return "upcoming"
        case .current:
            return "current"
        case .expired:
            return "past"
        }
    }
}

enum BookingTypeValet: Int {
    case upcoming
    case current
    case expired
    
    var value: String {
        switch self {
        case .upcoming:
            return "upcoming"
        case .current:
            return "current"
        case .expired:
            return "past"
        }
    }
}

enum BookingTypeEnforcement: Int {
    case current
    case expired
    
    var value: String {
        switch self {
        case .current:
            return "current"
        case .expired:
            return "past"
        }
    }
}

enum BootUnbootType: Int {
    case unboot
    case boot
    
    var value: String {
        switch self {
        case .unboot:
            return "Unboot"
        case .boot:
            return "Boot"
        }
    }
}

enum ReportType: Int {
    case revenue
    case hoursWorked
}

enum EFReportType: Int {
    case citation
    case unbooted
    case penalty
}

enum InformationAlertType {
    case revenue
    case validate
    case notify
    case reportViolation
    case createBookingSuccess
    case efNotify
    case efCreateCitation
    case verifyAlert
    case verifyAlertForAttendant
    case allowAddvalet
    case createPartialBookingSuccess
}

enum ShowAlertType {
    case switchAccount
    case reminder
}

enum RoleType: Int {
    case attendant
    case valet
    case enforcement
    case customer
    case business
    case none
}

enum RoleTypeParkingLot : Int {
    case attendant
    case enforcement
    
    var value: String {
        switch self {
        case .attendant:
            return "attendant"
        case .enforcement:
            return "enforcement"
        }
    }
}

enum whereCashDeposited: String {
    case bank = "bank"
    case supervisor = "supervisor"
}

enum RequestQueueType: Int {
    case queue
    case attending
    case ready
    case received
    
    var value: String {
        switch self {
        case .queue:
            return "queue"
        case .attending:
            return "attending"
        case .received:
            return "received"
        case .ready:
            return "ready"
        }
    }
}

enum GroupVehicleDetailsHeader {
    case status
    case contactInfo
    case vehicleInfo
    case reservationInfo
    case activeHistory
    
    var value: String {
        switch self {
        case .status:
            return AppString.userStatus()
        case .contactInfo:
            return AppString.contactInfo()
        case .reservationInfo:
            return AppString.reservations()
        case .vehicleInfo:
            return AppString.vehicleInfo()
        case .activeHistory:
            return AppString.activityHistory()
        }
    }
    
    var intValue: Int {
        switch self {
        case .status:
            return 0
        case .contactInfo:
            return 1
        case .vehicleInfo:
            return 2
        case .reservationInfo:
            return 3
        case .activeHistory:
            return 4
        }
    }
}

enum FleetVehicleDetailsHeader {
    case status
    case vehicleInfo
    case driverAndParkingInfo
    case activeHistory
    
    var value: String {
        switch self {
        case .status:
            return ""
        case .vehicleInfo:
            return AppString.vehicleInfo()
        case .driverAndParkingInfo:
            return AppString.driverNParkinglotInfo()
        case .activeHistory:
            return AppString.activityHistory()
        }
    }
    
    var intValue: Int {
        switch self {
        case .status:
            return 0
        case .vehicleInfo:
            return 1
        case .driverAndParkingInfo:
            return 2
        case .activeHistory:
            return 3
        }
    }
}

enum AddFleetVehicleHeader {
    case vehicleInfo
    case driverInfo
    
    var value: String {
        switch self {
        case .vehicleInfo:
            return AppString.vehicleInfo()
        case .driverInfo:
            return AppString.driverDetails()
        }
    }
    
    var intValue: Int {
        switch self {
        case .vehicleInfo:
            return 0
        case .driverInfo:
            return 1
        }
    }
    
}

enum AssignedParkingLotTypeValet: Int {
    case parkingLot
    case events
}

enum AttendantValetUserType: String {
    case guest = "guest"
    case transient = "transient"
    case regularUser = "regular user"
    case validation = "validation"
}

enum VerifyUsing {
    case rentalId
    case licencePlate
    case scanCode
    
    var value: String {
        switch self {
        case .rentalId:
            return AppString.rentalId()
        case .licencePlate:
            return AppString.licensePlateNo()
        case .scanCode:
            return AppString.scanQRCode()
        }
    }
    
    var intValue: Int {
        switch self {
        case .rentalId:
            return 0
        case .licencePlate:
            return 1
        case .scanCode:
            return 2
        }
    }
}

enum PaymentActionVia {
    case normal
    case edit
    case extend
    case none
}

enum CarIsReadyState: Int {
    case carIsReady
    case requestPaymentbySMS
    case payment
    
    var value: String {
        switch self {
        case .carIsReady:
            return AppString.yourCarIsReady()
        case .requestPaymentbySMS:
            return AppString.requestForPaymentBySMS()
        case .payment:
            return AppString.payment()
        }
    }
    
    var intValue: Int {
        switch self {
        case .carIsReady:
            return 0
        case .requestPaymentbySMS:
            return 1
        case .payment:
            return 2
        }
    }
}

enum TakeActionPaidState: Int {
    case returnBackToParkingLot
    case released
    case valetIsWaitingForYou
    
    var value: String {
        switch self {
        case .returnBackToParkingLot:
            return AppString.returnBackToParkingLot()
        case .released:
            return AppString.released().capitalized
        case .valetIsWaitingForYou:
            return AppString.valetIsWaitingForYou()
        }
    }
    
    var intValue: Int {
        switch self {
        case .returnBackToParkingLot:
            return 0
        case .released:
            return 1
        case .valetIsWaitingForYou:
            return 2
        }
    }
}

enum TakeActionUnpaidState: Int {
    case returnBackToParkingLot
    case requestPaymentbySMS
    case payment
    case valetIsWaitingForYou
    
    var value: String {
        switch self {
        case .returnBackToParkingLot:
            return AppString.returnBackToParkingLot()
        case .requestPaymentbySMS:
            return AppString.requestForPaymentBySMS()
        case .payment:
            return AppString.payment()
        case .valetIsWaitingForYou:
            return AppString.valetIsWaitingForYou()
        }
    }
    
    var intValue: Int {
        switch self {
        case .returnBackToParkingLot:
            return 0
        case .requestPaymentbySMS:
            return 1
        case .payment:
            return 2
        case .valetIsWaitingForYou:
            return 3
        }
    }
}


enum RequestQueueFlowType: Int {
    case carIsReady
    case takeAction
}

enum VehicleStatus {
    case active
    case inActive
    case both
    
    var value: String {
        switch self {
        case .active:
            return AppString.activeStatus()
        case .inActive:
            return AppString.inActiveStatus()
        case .both:
            return AppString.bothStatus()
        }
    }
}

enum FleetVehicleActivity {
    case reActivate
    case deActivate
    case driverInfoStatus
    case driverInfo
    case startDate
    case vehicleInfoStatus
    case vehicleInfo
    case contactInfo
    case reActivateRequest
    case deActivateRequest
    
    var type: String {
        switch self {
        case .reActivate:
            return "re_activate"
        case .deActivate:
            return "de_activate"
        case .driverInfoStatus:
            return "driver_info_status"
        case .driverInfo:
            return "driver_info"
        case .startDate:
            return "start_date"
        case .vehicleInfoStatus:
            return "vehicle_info_status"
        case .vehicleInfo:
            return "vehicle_info"
        case .contactInfo:
            return "contact_info"
        case .reActivateRequest:
            return "re_activate_request"
        case .deActivateRequest:
            return "de_activate_request"
        }
    }
    
    var value: String {
        switch self {
        case .reActivate:
            return "Re-Activated"
        case .deActivate:
            return "De-Activated"
        case .driverInfoStatus:
            return "Driver Info Status"
        case .driverInfo:
            return "Driver Info"
        case .startDate:
            return "Start Date"
        case .vehicleInfoStatus:
            return "Vehicle Info Status"
        case .vehicleInfo:
            return "Vehicle Info"
        case .contactInfo:
            return "Contact info"
        case .reActivateRequest:
            return "Re-Activate request"
        case .deActivateRequest:
            return "De-Activate request"
        }
    }
}

enum GroupVehicleActivity {
    case vehicleActivated
    case vehicleDeActivated
    case userInfoUpdated
    case userActivated
    case userDeActivated
    case userReActivatedReq
    case userDeActivatedReq
    case reservationDeActivated
    case reservationActivated
    
    var type: String {
        switch self {
        case .vehicleActivated:
            return "vehicelActivated"
        case .vehicleDeActivated:
            return "vehicelDeActivated"
        case .userInfoUpdated:
            return "userInfoUpdated"
        case .userActivated:
            return "userActivated"
        case .userDeActivated:
            return "userDeActivated"
        case .reservationDeActivated:
            return "reservationDeActivated"
        case .reservationActivated:
            return "reservationActivated"
        default:
            return ""
        }
    }
    
    var value: String {
        switch self {
        case .vehicleActivated:
            return "Vehicle Activated"
        case .vehicleDeActivated:
            return "Vehicle De-Activated"
        case .userInfoUpdated:
            return "User Info Updated"
        case .userActivated:
            return "User Activated"
        case .userDeActivated:
            return "User De-Activated"
        case .userReActivatedReq:
            return "User Re-Activate request"
        case .userDeActivatedReq:
            return "User De-Activate request"
        case .reservationDeActivated:
            return "Reservation De-Activated"
        case .reservationActivated:
            return "Reservation Activated"
        }
    }
}

enum EnforcerCitationActivity {
    case issuedDate
    case paymentDueDate
    case vehicleBootedDate
    case paymentProcessingDate
    case vehicleUnbootDate
    case citationPaymentNotifyDetails
    case customerCitationNotifyDate
    case supervisorNotifyDate
    case attendantValetNotifyDate
    case paymentNotifyDate
    
    var type: String {
        switch self {
        case .issuedDate:
            return "issuedDate"
        case .paymentDueDate:
            return "paymentDueDate"
        case .vehicleBootedDate:
            return "vehicleBootedDate"
        case .paymentProcessingDate:
            return "paymentProcessingDate"
        case .vehicleUnbootDate:
            return "vehicleUnbootDate"
        case .citationPaymentNotifyDetails:
            return "citationPaymentNotifyDetails"
        case .customerCitationNotifyDate:
            return "customerCitationNotifyDate"
        case .paymentNotifyDate:
            return "paymentNotifyDate"
        case .supervisorNotifyDate:
            return "supervisorNotifyDate"
        case .attendantValetNotifyDate:
            return "attendantValetNotifyDate"
        }
    }
    
    var value: String {
        switch self {
        case .issuedDate:
            return AppString.issuedDate()
        case .paymentDueDate:
            return AppString.paymentDueDate()
        case .vehicleBootedDate:
            return AppString.vehicleBootedDate()
        case .paymentProcessingDate:
            return AppString.paymentProcessingDate()
        case .vehicleUnbootDate:
            return AppString.vehicleUnbootDate()
        case .citationPaymentNotifyDetails:
            return AppString.citationPaymentNotifyDetails()
        case .paymentNotifyDate:
            return AppString.customerCitationNotifyDate()
        case .customerCitationNotifyDate:
            return AppString.paymentNotifyDate()
        case .supervisorNotifyDate:
            return AppString.supervisorNotifyDate()
        case .attendantValetNotifyDate:
            return AppString.attendantValetNotifyDate()
        }
    }
    
}

enum deleteVehicleType {
    case group
    case fleet
}

enum addEditGroupVehicleType {
    case add
    case edit
}

enum DateOrTime {
    case date
    case time
}

enum EditOptions {
    case edit
    case delete
    
    var optionIndex: Int {
        switch self {
        case .edit:
            return 0
        case .delete:
            return 1
        }
    }
    
    var value: String {
        switch self {
        case .edit:
            return "Edit"
        case .delete:
            return "Delete"
        }
    }
}

enum ChatOptions: Int {
    case createNewChat = 0
    case createGroupChat
    
    var value: String {
        switch self {
        case .createNewChat:
            return AppString.createNewChat()
        case .createGroupChat:
            return AppString.createGroupChat()
        }
    }
}

enum ChatSettingOptions: Int {
    case archived = 0
    case blocked
    
    var value: String {
        switch self {
        case .archived:
            return AppString.archivedUsers()
        case .blocked:
            return AppString.blockedUsers()
        }
    }
}

enum ChatConversationSettingOptions: Int {
    
    case share = 0
    case export
    case archived
    case block, Unblock
    case Unarchive
    
    var value: String {
        switch self {
        case .archived:
            return AppString.archive()
        case .share:
            return AppString.share()
        case .export:
            return AppString.export()
        case .block:
            return AppString.block()
        case .Unblock:
            return AppString.unBlock()
        case .Unarchive:
            return AppString.unArchived()
        }
    }
    
}

enum BusinessReservationType: String {
    case single = "single"
    case multiple = "multiple"
}

enum MonthlyCategoryTypes {
    case monthly_Regular
    case monthly_24_7
    case oversized_Monthly
    case oversized_Monthly_24_7
    
    var type: String {
        switch self {
        case .monthly_Regular:
            return "Monthly_Regular"
        case .monthly_24_7:
            return "Monthly_24_7"
        case .oversized_Monthly:
            return "Oversized_Monthly"
        case .oversized_Monthly_24_7:
            return "Oversized_Monthly_24_7"
        }
    }
    
}

enum SingleMonthlyCategoryTypes {
    case monthly_Regular
    case monthly_24_7
    case oversized_Monthly
    case oversized_Monthly_24_7
    case oversized_Regular
    
    var type: String {
        switch self {
        case .monthly_Regular:
            return AppString.monthly()
        case .monthly_24_7:
            return AppString.monthlyReserved()
        case .oversized_Monthly:
            return AppString.oversizedMonthlyTitle()
        case .oversized_Monthly_24_7:
            return AppString.oversizedMonthly24Title()
        case .oversized_Regular:
            return AppString.oversizedRegularTitle()
        }
    }
    
    var slotType: String {
        switch self {
        case .monthly_Regular:
            return AppString.monthlyRegular()
        case .monthly_24_7:
            return AppString.monthly247()
        case .oversized_Monthly:
            return AppString.oversizedMonthly()
        case .oversized_Monthly_24_7:
            return AppString.oversizedMonthly247()
        case .oversized_Regular:
            return AppString.oversizedRegular()
        }
    }
    
    var tag: Int {
        switch self {
        case .monthly_Regular:
            return 0
        case .monthly_24_7:
            return 1
        case .oversized_Monthly:
            return 2
        case .oversized_Monthly_24_7:
            return 3
        case .oversized_Regular:
            return 4
        }
    }
    
    var categoryType: String {
        switch self {
        case .monthly_Regular:
            return "monthly_Regular"
        case .monthly_24_7:
            return "monthly_24_7"
        case .oversized_Monthly:
            return "oversized_Monthly"
        case .oversized_Monthly_24_7:
            return "Oversized_Monthly_24_7"
        case .oversized_Regular:
            return "Oversized_Regular"
        }
    }
    
    var categoryTypeValue: String {
        switch self {
        case .monthly_Regular:
            return "Monthly_Regular"
        case .monthly_24_7:
            return "Monthly_24_7"
        case .oversized_Monthly:
            return "Oversized_Monthly"
        case .oversized_Monthly_24_7:
            return "Oversized_Monthly_24_7"
        case .oversized_Regular:
            return "Oversized_Regular"
        }
    }
}

enum VehicleTypes: String {
    case group = "group"
    case fleet = "fleet"
}

enum ParkingLocationSections {
    case coverImage
    case parkingInfoAndPrice
    case dateSelection
    case facilityInfoAndRates
    case facilityInfo
    case priceRatesInfo
    /*case thingsToKnowInfo
    case aminitiesInfo
    case accessHoursInfo
    case redeemInfo
    case gettingThereInfo
    case policiesInfo
    case parkingLotPriceRateInfo*/

    var indexValue: Int {
        switch self {
        case .coverImage:
            return 0
        case .parkingInfoAndPrice:
            return 1
        case .dateSelection:
            return 2
        case .facilityInfoAndRates:
            return 3
        case .facilityInfo:
            return 4
        case .priceRatesInfo:
            return 5
        }
    }
}

enum ShareLinkOptionTypes: Int {
    case email = 0
    case phoneNumber = 1
}

enum ChatConversionType: Int {
    case sender = 0
    case receiver
    case memberEvent
}

enum reservationStatus: String {
    case cancelled = "cancelled";
}

enum CitationStateType: String {
    case disputeCitation = "disputeCitation"
    case updateCitationFineAmount = "updateCitationFineAmount"
}

enum ChatRoleType: String {
    case enforcement = "enforcement"
    case attendant = "attendant"
    case valet = "valet"
}

enum ReservationActionTaken: String {
    case notify = "notify"
    case payment = "payment"
}

enum ReservationPaymentMethod: String {
    case sms = "sms"
    case cash = "cash"
    case credit = "credit"
}

enum ReservationNotificationType: String {
    case readyStateValetWaiting = "readyStateValetWaiting"
    case returnBackParkingLot = "returnBackParkingLot"
}

enum AttendantReservationType: String {
    case validation = "validation"
    case past = "past"
    case institute = "institute"
    case reservation = "reservation"
    case business = "business"
    case reservedEvent = "reservedEvent"
}

enum ApprovalStatus: String {
    case unapproved = "unapproved"
    case approved = "approved"
}

enum RequestStatus: String {
    case notVerified = "not-verified"
}

enum ReservationCreatedBy: String {
    case customer = "customer"
    case business = "business"
}

enum BookingStatus: String {
    case cancelledMonthly = "cancelledMonthly"
    case confirmed = "confirmed"
    case expired = "expired"
}

enum PassType {
    case daily
    case monthly
    
    var value: String {
        switch self {
        case .daily:
            return "Daily Pass"
        case .monthly:
            return "Monthly Pass"
        }
    }
    
}

enum AttendantVehicleTypes {
    case regular
    case oversized
    
    var value: String {
        switch self {
        case .regular:
            return "Regular Vehicle"
        case .oversized:
            return "Oversized Vehicle"
        }
    }
    
}

enum SideMenuOptions {
     
    case home
    case attendance
    case manageBooking
    case partialBooking
    case externalParking
    case closeBooking
    case assignedParkingLot
    case profile
    case keysLog
    case notification
    case report
    case chat
    case setting

    var indexValue: Int {
        switch self {
        case .home:
            return 0
        case .attendance:
            return 1
        case .manageBooking:
            return 2
        case .partialBooking:
            return 3
        case .externalParking:
            return 4
        case .closeBooking:
            return 5
        case .assignedParkingLot:
            return 6
        case .profile:
            return 7
        case .keysLog:
            return 8
        case .notification:
            return 9
        case .report:
            return 10
        case .chat:
            return 11
        case .setting:
            return 12
        }
    }
    
}

enum PassDetailsSections {
    case qRCodeAndReservationDetails
    case vehicleDetails
    case parkingInfo
   
    var indexValue: Int {
        switch self {
        case .qRCodeAndReservationDetails:
            return 0
        case .vehicleDetails:
            return 1
        case .parkingInfo:
            return 2
        }
    }
}

enum LeaveOffsetStatus: String {
    case pending = "Pending"
    case approved = "Approved"
    case rejected = "Denied"
    case cancel = "Cancelled"
}

enum InstituteFilterScreenVia {
    case payroll
    case leaveOffset
}

enum AskReasonScreenVia {
    case cancelLeaveRequest
    case freezeAccount
    case closeAccount
    case unFreezeAccount
    case activeAccount
    case cancelRequest
}

enum SimulateLPR {
    case licensePlateDetails
    case validReservationDetails
    case inValidReservationDetails
    case duplicateVehicleDetails
    case unauthorisedAccessDetails
    case storageOccupancyDetails
    
    var indexValue: Int {
        switch self {
        case .licensePlateDetails:
            return 0
        case .validReservationDetails:
            return 1
        case .inValidReservationDetails:
            return 2
        case .duplicateVehicleDetails:
            return 3
        case .unauthorisedAccessDetails:
            return 4
        case .storageOccupancyDetails:
            return 5
        }
    }
}

enum AccountType {
    case freezeAccount
    case closeAccount
    case unFreezeAccount
    case activeAccount
    
    var apiValue: String {
        switch self {
        case .freezeAccount:
            return "freeze"
        case .closeAccount:
            return "close"
        case .unFreezeAccount:
            return "unFreeze"
        case .activeAccount:
            return "active"
        }
    }
}

enum AccountActionStatus: String {
    case pending = "Pending"
    case approved = "Approved"
    case rejected = "Denied"
    case cancel = "Cancelled"
    
    var freezeButtonTitle: String {
        switch self {
        case .pending:
            return "Cancel Freeze Request"
        case .approved:
            return "Unfreeze"
        case .rejected:
            return "Freeze Request"
        case .cancel:
            return "Freeze Account"
        }
    }
    
    var closeButtonTitle: String {
        switch self {
        case .pending:
            return "Cancel Close Request"
        case .approved:
            return "Activate Account"
        case .rejected:
            return "Close Request"
        case .cancel:
            return "Close Account"
        }
    }
    
    var activeButtonTitle: String {
        switch self {
        case .pending:
            return "Cancel Active Request"
        case .approved:
            return "Close Account"
        case .rejected:
            return "Activate Account"
        case .cancel:
            return "Cancel Close Request"
        }
    }
    
    var unFreezeButtonTitle: String {
        switch self {
        case .pending:
            return "Cancel UnFreeze Request"
        case .approved:
            return "Freeze Account"
        case .rejected:
            return "UnFreeze Request"
        case .cancel:
            return "UnFreeze Account"
        }
    }
    
    var statusTitleColor: UIColor {
        switch self {
        case .pending:
            return AppColor.orangeColor() ?? .systemOrange
        case .approved:
            return AppColor.paidColor() ?? .green
        case .rejected:
            return AppColor.redColor() ?? .red
        case .cancel:
            return AppColor.pinkColor() ?? .systemPink
        }
    }
}

enum LPRManagement: String {
    case valid = "valid"
    case invalid = "invalid"
}

enum TransferRequestSections {
    case requestInfo
    case currentParkingLocation
    case transferToLocation
   
    var indexValue: Int {
        switch self {
        case .requestInfo:
            return 0
        case .currentParkingLocation:
            return 1
        case .transferToLocation:
            return 2
        }
    }
    
    var titleValue: String {
        switch self {
        case .requestInfo:
            return ""
        case .currentParkingLocation:
            return "Current Parking Location"
        case .transferToLocation:
            return "Transfer to Location"
        }
    }
}

enum TransferActionStatus: String {
    case pending = "Pending"
    case approved = "Approved"
    case rejected = "Denied"
    case cancel = "Cancelled"
    
    var cancelButtonTitle: String {
        switch self {
        case .pending:
            return "Cancel Request Transfer"
        case .approved, .rejected, .cancel:
            return "Request Transfer"
        }
    }
    
    var statusTitleColor: UIColor {
        switch self {
        case .pending:
            return AppColor.orangeColor() ?? .systemOrange
        case .approved:
            return AppColor.paidColor() ?? .green
        case .rejected:
            return AppColor.redColor() ?? .red
        case .cancel:
            return AppColor.pinkColor() ?? .systemPink
        }
    }
}
