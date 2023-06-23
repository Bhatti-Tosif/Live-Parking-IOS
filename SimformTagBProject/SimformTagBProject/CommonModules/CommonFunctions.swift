//
//  CommonFunctions.swift
//  TagBDemo
//
//  Created by Ami Solani on 12/10/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication
import PassKit
//import StripeCore
import AVFoundation

func setAppStatusBarColor(color: UIColor = UIColor.blue) {
    if #available(iOS 13, *) {
        guard let frame = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame else { return }
        let statusBar = UIView(frame: frame)
        statusBar.backgroundColor = color
        UIApplication.shared.keyWindow?.addSubview(statusBar)
    } else {
        UIApplication.shared.statusBarView?.backgroundColor = color
    }
}

// create a 1x1 image with this color
func imageWithColor(color: UIColor) -> UIImage {
    let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context!.setFillColor(color.cgColor);
    context!.fill(rect);
    let image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image!
}

func setNavigationTitle(navigationItem: UINavigationItem) {
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
    imageView.contentMode = .scaleAspectFit
    imageView.image = AppImage.lightLogo()
    navigationItem.titleView = imageView
}

func dateAndTimeSeparator(selectedDateString: String) -> (String, String) {
    let component = selectedDateString.components(separatedBy: dash)
    return (component[0], component[1])
}

func getCurrentDateAndTime() -> (String, String) {
    let component = (Date().nearestTimeWithFifteenMinInterval().getString(inFormat: DateFormat.dateAndTime.rawValue)).components(separatedBy: dash)
    return (component[0], component[1])
}

func getCurrentDateAndTimeWithoutMinInterval() -> (String, String) {
    if let component = (Date().getString(inFormat: DateFormat.dateAndTime.rawValue)).components(separatedBy: dash) as? [String], component.count > 1 {
        return (component[0], component[1])
    }
    return ("", "")
}

func getCurrentDateAndTimeDate() -> Date {
    return Date().nearestTimeWithFifteenMinInterval()
}

func getCurrentDateAndTimeWithoutInterval() -> (String, String) {
    let component = (Date().getString(inFormat: DateFormat.dateAndTime.rawValue)).components(separatedBy: dash)
    return (component[0], component[1])
}

func getCurrentDateAndTimeWithAPIFormat() -> (String, String) {
    let component = (Date().nearestTimeWithFifteenMinInterval().getString(inFormat: DateFormat.dateAndTimeFormat.rawValue)).components(separatedBy: comma)
    return (component[0], component[1])
}

func getAfterOneHourTimeWithAPIFormat() -> (String, String) {
    let calendar = Calendar.current
    if let date = calendar.date(byAdding: .minute, value: 60, to: Date().nearestTimeWithFifteenMinInterval()) {
        let component = (date.getString(inFormat: DateFormat.dateAndTimeFormat.rawValue)).components(separatedBy: comma)
        return (component[0], component[1])
    } else {
        return ("", "")
    }
}

func getAfterThreeHourTime() -> (String, String) {
    let calendar = Calendar.current
    if let date = calendar.date(byAdding: .minute, value: 180, to: Date().nearestTimeWithFifteenMinInterval()) {
        let component = (date.getString(inFormat: DateFormat.dateAndTime.rawValue)).components(separatedBy: dash)
        return (component[0], component[1])
    } else {
        return ("", "")
    }
}

func getAfterOneHourTime(currentTimeWithoutFifteenMinInterval: Bool? = false) -> (String, String) {
    let calendar = Calendar.current
    if let date = calendar.date(byAdding: .minute, value: 60, to: currentTimeWithoutFifteenMinInterval ?? false ? Date() : Date().nearestTimeWithFifteenMinInterval()) {
        let component = (date.getString(inFormat: DateFormat.dateAndTime.rawValue)).components(separatedBy: dash)
        return (component[0], component[1])
    } else {
        return ("", "")
    }
}

func getAfterOneHourTimeDate() -> Date? {
    let calendar = Calendar.current
    if let date = calendar.date(byAdding: .minute, value: 60, to: Date().nearestTimeWithFifteenMinInterval()) {
        return date
    }
    return nil
}

func getAfterOneDay() -> (String, String) {
    let calendar = Calendar.current
    if let date = calendar.date(byAdding: .minute, value: 1440, to: Date().nearestTimeWithFifteenMinInterval()) {
        let component = (date.getString(inFormat: DateFormat.dateAndTime.rawValue)).components(separatedBy: dash)
        return (component[0], component[1])
    } else {
        return ("", "")
    }
}

func getAfterOneMonthDate(startDate: Date) -> (String, String) {
    let calendar = Calendar.current
    if let date = calendar.date(byAdding: .month, value: 1, to: startDate) {
        let component = (date.getString(inFormat: DateFormat.dateAndTimeFormat.rawValue)).components(separatedBy: comma)
        return (component[0], component[1])
    } else {
        return ("", "")
    }
}

func getAfterOneMonthDateUTC(startDate: Date) -> String {
    let calendar = Calendar.current
    if let date = calendar.date(byAdding: .month, value: 1, to: startDate) {
        return date.getString(inFormat: DateFormat.enUSDateFormat.rawValue, apptimeZone: .utc)
    }
        return ""
}

func getFormatedDateAndTime(date: Date) -> (String, String) {
    let component = (date.getString(inFormat: DateFormat.dateAndTimeFormat.rawValue)).components(separatedBy: comma)
    return (component[0], component[1])
}

func getFormatedDateAndTimeWithTimeZone(date: Date, timeZone: AppTimeZone) -> (String, String) {
    let component = (date.getString(inFormat: DateFormat.dateAndTimeFormat.rawValue, apptimeZone: timeZone)).components(separatedBy: comma)
    return (component[0], component[1])
}

func getFormatedDateAndTimeWithDash(date: Date) -> (String, String) {
    let component = (date.getString(inFormat: DateFormat.dateAndTime.rawValue)).components(separatedBy: dash)
    return (component[0], component[1])
}

func getFormatedDateAndTimeWithDash(date: Date, timeZone: AppTimeZone) -> (String, String) {
    let component = (date.getString(inFormat: DateFormat.dateAndTime.rawValue, apptimeZone: timeZone)).components(separatedBy: dash)
    return (component[0], component[1])
}

func metersToMile(meter: Float) -> Double {
    return Double((meter)/Float(1609.34))
}

func getDateString(dateString: String, inFormat: String, outFormat: String, separatedBy: String) -> (String, String) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = inFormat
    guard let date = dateFormatter.date(from: dateString) else { return ("", "") }
    dateFormatter.dateFormat = outFormat
    let stringComponents = dateFormatter.string(from: date).components(separatedBy: separatedBy)
    return (stringComponents[0], stringComponents[1])
}

func getDateOnlyString(dateString: String, inFormat: String, outFormat: String, separatedBy: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = inFormat
    guard let date = dateFormatter.date(from: dateString) else { return "" }
    dateFormatter.dateFormat = outFormat
    let stringComponents = dateFormatter.string(from: date).components(separatedBy: separatedBy)
    return stringComponents[0]
}

func getTimeString(dateString: String, inFormat: String, outFormat: String, separatedBy: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = inFormat
    guard let date = dateFormatter.date(from: dateString) else { return "" }
    dateFormatter.dateFormat = outFormat
    let stringComponents = dateFormatter.string(from: date).components(separatedBy: separatedBy)
    return (stringComponents[0])
}

func setLightSystemFont(size: CGFloat = 14) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .light)
}

func setRegularSystemFont(size: CGFloat = 14) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .regular)
}

func setMediumSystemFont(size: CGFloat = 14) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .medium)
}

func setSemiBoldSystemFont(size: CGFloat = 14) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .semibold)
}

func setBoldSystemFont(size: CGFloat = 14) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .bold)
}

func convertToDateAndTimeFormat(date: String, timeZone: TimeZone) -> (String, String) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = DateFormat.apiDateFormat.rawValue
    dateFormatter.timeZone = timeZone
    guard let date = dateFormatter.date(from: date) else { return ("", "") }
    let component = date.getString(inFormat: DateFormat.dateAndTime.rawValue).components(separatedBy: dash)
    return (component[0], component[1])
}

func convertToSystemDateAndTimeFormat(date: String, timeZone: TimeZone) -> (String, String) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = DateFormat.apiDateFormat.rawValue
    dateFormatter.timeZone = timeZone
    guard let date = dateFormatter.date(from: date) else { return ("", "") }
    let component = date.getString(inFormat: DateFormat.dateAndTimeFormat.rawValue).components(separatedBy: comma)
    return (component[0], component[1])
}


func convertToDateAndTimeFormat(date: String, inFormat: DateFormat, timeZone: AppTimeZone) -> (String, String) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = inFormat.rawValue
    dateFormatter.timeZone = timeZone == .current ? .current : TimeZone(identifier: "GMT")!
    guard let date = dateFormatter.date(from: date) else { return ("", "") }
    let component = date.getString(inFormat: DateFormat.dateAndTime.rawValue).components(separatedBy: dash)
    return (component[0], component[1])
}

func getenUSDateFormat() -> String {
    return Date().getString(inFormat: DateFormat.enUSDateFormat.rawValue)
}

func getEventDate(date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = DateFormat.dateWithSpace.rawValue
    guard let date = dateFormatter.date(from: date) else { return "" }
    return date.getString(inFormat: DateFormat.reverseDate.rawValue)
}

func getStringDate(date: String, informat: String, outputFormat: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = informat
    guard let date = dateFormatter.date(from: date) else { return "" }
    return date.getString(inFormat: outputFormat)
}

func getStringDate(date: String, informat: String, outputFormat: String, timeZone: AppTimeZone) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = informat
    dateFormatter.timeZone = timeZone == .current ? .current : TimeZone(identifier: "GMT")!
    guard let date = dateFormatter.date(from: date) else { return "" }
    return date.getString(inFormat: outputFormat, apptimeZone: timeZone)
}

func getStringDate(date: String, informat: String, outputFormat: String, outputTimeZone: AppTimeZone) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = informat
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    guard let date = dateFormatter.date(from: date) else { return "" }
    return date.getString(inFormat: outputFormat, apptimeZone: outputTimeZone)
}

func getStringDate(date: String, informat: String, outputFormat: String, timeZone: AppTimeZone, outputTimeZone: AppTimeZone) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = informat
    dateFormatter.timeZone = timeZone == .current ? .current : TimeZone(identifier: "GMT")!
    guard let date = dateFormatter.date(from: date) else { return "" }
    return date.getString(inFormat: outputFormat, apptimeZone: outputTimeZone)
}

func getStringDateFromUTC(date: String, informat: String, outputFormat: String, timeZone: AppTimeZone) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = informat
    dateFormatter.timeZone = TimeZone(identifier: "GMT")!
    guard let date = dateFormatter.date(from: date) else { return "" }
    return date.getString(inFormat: outputFormat, apptimeZone: timeZone)
}

func convertToDateAndTimeFormatFromUTC(date: String, timeZone: AppTimeZone) -> (String, String) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = DateFormat.apiDateFormat.rawValue
    dateFormatter.timeZone = TimeZone(identifier: "GMT")!
    guard let date = dateFormatter.date(from: date) else { return ("", "") }
    let component = date.getString(inFormat: DateFormat.dateAndTime.rawValue, apptimeZone: timeZone).components(separatedBy: dash)
    return (component[0], component[1])
}

func convertToDateAndTimeFormatForReverseDate(date: String, timeZone: AppTimeZone) -> (String, String) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = DateFormat.reverseDate.rawValue
    dateFormatter.timeZone = TimeZone(identifier: "GMT")!
    guard let date = dateFormatter.date(from: date) else { return ("", "") }
    let component = date.getString(inFormat: DateFormat.dateAndTime.rawValue, apptimeZone: timeZone).components(separatedBy: dash)
    return (component[0], component[1])
}

func UTCToLocal(UTCDateString: String, inputFormat: String, outputFormat: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = inputFormat
    dateFormatter.timeZone = TimeZone(identifier: "GMT")!
    guard let UTCDate = dateFormatter.date(from: UTCDateString) else{ return "" }
    let newDateFormatter = DateFormatter()
    newDateFormatter.dateFormat = outputFormat
    newDateFormatter.timeZone = TimeZone.current
    let UTCToCurrentFormat = newDateFormatter.string(from: UTCDate)
    return UTCToCurrentFormat
}

func getStringToDate(date: String, informat: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = informat
    dateFormatter.timeZone = TimeZone(identifier: "GMT")!
    guard let newDate = dateFormatter.date(from: date) else { return nil }
    return newDate
}

func getStringToDateForLocal(date: String, informat: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = informat
    dateFormatter.timeZone = .current
    guard let newDate = dateFormatter.date(from: date) else { return nil }
    return newDate
}

func getDateFromUTCStringForDatePicker(utcDate: String, informat: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = informat
    dateFormatter.timeZone = TimeZone(identifier: "GMT")!
    guard let UTCDate = dateFormatter.date(from: utcDate) else{ return nil }
    return UTCDate
}

func format(phoneNumber: String, shouldRemoveLastDigit: Bool = false) -> String {
    guard !phoneNumber.isEmpty else { return "" }
    guard let regex = try? NSRegularExpression(pattern: phoneNumberAllowedRegex, options: .caseInsensitive) else { return "" }
    let r = NSString(string: phoneNumber).range(of: phoneNumber)
    var number = regex.stringByReplacingMatches(in: phoneNumber, options: .init(rawValue: 0), range: r, withTemplate: "")
    
    if number.count > 10 {
        let tenthDigitIndex = number.index(number.startIndex, offsetBy: 10)
        number = String(number[number.startIndex..<tenthDigitIndex])
    }
    
    if shouldRemoveLastDigit {
        let end = number.index(number.startIndex, offsetBy: number.count-1)
        number = String(number[number.startIndex..<end])
    }
    
    if number.count < 7 {
        let end = number.index(number.startIndex, offsetBy: number.count)
        let range = number.startIndex..<end
        number = number.replacingOccurrences(of: regexPhoneNumber3plus, with: numberFormateInBacket3Digit, options: .regularExpression, range: range)
        
    } else {
        let end = number.index(number.startIndex, offsetBy: number.count)
        let range = number.startIndex..<end
        number = number.replacingOccurrences(of: regexPhoneNumber334plus, with: regexPhoneNumberforAppFormate, options: .regularExpression, range: range)
    }
    
    return number
}

func callNumber(phoneNum: String) {
    let cleanPhoneNumber = phoneNum.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
    let urlString:String = "tel://\(cleanPhoneNumber)"
    if let phoneCallURL = URL(string: urlString) {
        if (UIApplication.shared.canOpenURL(phoneCallURL)) {
            UIApplication.shared.open(phoneCallURL, options: [:], completionHandler: nil)
        }
    }
}

func getDateForAPI(date: String, time: String) -> (String, String) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = DateFormat.dateAndTime.rawValue
    let item = date + "-" + time
    guard let date = dateFormatter.date(from: item) else { return ("", "") }
    return getFormatedDateAndTime(date: date)
}

func getHrFrom(seconds: Int) -> (Int, Int) {
    let hours: Int = seconds / 3600
    let minutes: Int = (seconds % 3600) / 60
    return (hours, minutes)
}

func formatExpDateYear(dateYear: String, shouldRemoveLastDigit: Bool = false) -> String {
    guard !dateYear.isEmpty else { return "" }
    guard let regex = try? NSRegularExpression(pattern: phoneNumberAllowedRegex, options: .caseInsensitive) else { return "" }
    let r = NSString(string: dateYear).range(of: dateYear)
    var number = regex.stringByReplacingMatches(in: dateYear, options: .init(rawValue: 0), range: r, withTemplate: "")
    
    if number.count > 7 {
        let tenthDigitIndex = number.index(number.startIndex, offsetBy: 7)
        number = String(number[number.startIndex..<tenthDigitIndex])
    }
    
    if shouldRemoveLastDigit {
        let end = number.index(number.startIndex, offsetBy: number.count-1)
        number = String(number[number.startIndex..<end])
    }
    
    if number.count < 4 {
        let end = number.index(number.startIndex, offsetBy: number.count)
        let range = number.startIndex..<end
        number = number.replacingOccurrences(of: regexExpDateYearForIntermediateString, with: regexSeparateStringBySlash, options: .regularExpression, range: range)
        
    } else {
        let end = number.index(number.startIndex, offsetBy: number.count)
        let range = number.startIndex..<end
        number = number.replacingOccurrences(of: regexForExpDateYearComplete, with: regexSeparateStringBySlash, options: .regularExpression, range: range)
    }
    return number
}
    
func getAPIDates(date: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = DateFormat.apiDateFormat.rawValue
    dateFormatter.timeZone = .current
    let date = dateFormatter.date(from: date)
    return date
}

func getAPIDatesFromUTC(date: String, inputFormat: String, timezone: AppTimeZone) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = inputFormat
    dateFormatter.timeZone = timezone == .current ? .current : TimeZone(identifier: "GMT")!
    dateFormatter.dateFormat = DateFormat.apiDateFormat.rawValue
    let date = dateFormatter.date(from: date)
    return date
}

func getAPIDates(date: String, inputFormat: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = inputFormat
    let date = dateFormatter.date(from: date)
    return date
}

func convertToAPIDateAndTimeFormat(date: String) -> (String, String) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = DateFormat.apiDateFormat.rawValue
    guard let date = dateFormatter.date(from: date) else { return ("", "") }
    let apiDate = date.getString(inFormat: DateFormat.reverseDate.rawValue)
    let apiTime = date.getString(inFormat: DateFormat.apiTime.rawValue)
    return (apiDate, apiTime)
}

func getStringfromDateStringInApiRequestFormateWith( _ currentFormat: DateFormat, inputDate: String) -> String {
    let dateString = inputDate
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = currentFormat.rawValue
    let dateObj = dateFormatter.date(from: dateString) ?? Date()
    dateFormatter.dateFormat = DateFormat.reverseDate.rawValue
    return dateFormatter.string(from: dateObj)
}

func getTimeZoneIdentifier() -> String {
    return TimeZone.current.identifier
}

func getDirectoryPath() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

func loadPDFAndShare(isFindFromLocal: Bool, filePath: String, completionHandler: @escaping (String?, Bool)
                        -> Void) {
    let fileManager = FileManager.default
    var documentoPath = ""

    if isFindFromLocal {
        documentoPath = (getDirectoryPath() as NSString).appendingPathComponent("\(filePath).pdf")
    }

    let fileLocation = isFindFromLocal ? documentoPath : filePath
    debugPrint(fileLocation)

    if fileManager.fileExists(atPath: fileLocation){
        completionHandler(fileLocation, true)
    } else {
        debugPrint("document was not found")
        completionHandler(nil, false)
    }
}

func deleteLoadedFile(filePath: String) {

    // Fine documents directory on device
    let dirs : [String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)

    var documentoPath = ""

    if dirs.count > 0 {
        let dir = dirs[0] //documents directory
        documentoPath = dir.appendingFormat("/\(filePath).pdf")
        debugPrint("Local path = \(documentoPath)")
        documentoPath = "file://" + documentoPath
    } else {
        debugPrint("Could not find local directory to store file")
        return
    }

    guard let url = URL(string: userManager.downlodedUrlString) else { return }
    print(url.path,"\n")

    do {
        let fileManager = FileManager.default
        // Check if file exists
        if fileManager.fileExists(atPath: url.path) {
            try fileManager.removeItem(atPath: url.path)
        } else {
            debugPrint("File does not exist")
        }
    } catch let error as NSError {
        debugPrint("An error took place: \(error)")
    }
}

func shareFileDialogue(view: UIView, vc: UIViewController, documentPath: String) {
    let fileURL = NSURL(fileURLWithPath: documentPath)
    var filesToShare = [Any]()
    filesToShare.append(fileURL)
    let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: filesToShare, applicationActivities: nil)
    activityViewController.popoverPresentationController?.sourceView = view
    vc.present(activityViewController, animated: true, completion: nil)
}

func shareLinkDialogue(view: UIView, Vc: UIViewController, link: String) {
    guard let shareLink = URL(string: link) else { return }
    let objectsToShare: [Any] = [shareLink]
    let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
    activityViewController.popoverPresentationController?.sourceView = view
    Vc.present(activityViewController, animated: true, completion: nil)
}

func getDiscountedValue(charge: Float, percentage: Float, type: DiscountType,  maxDisCount: Float) -> Float {
    switch type {
    case .percentage:
        let value = charge * percentage
        return (maxDisCount < value/100) ? maxDisCount : value/100
    case .flat:
        return maxDisCount
    }
}

func timeFormattedInHMS(_ totalSeconds: Int) -> (String, String, String) {
    let hours: Int = totalSeconds / 3600
    let minutes: Int = (totalSeconds % 3600) / 60
    let seconds: Int = (totalSeconds % 3600) % 60
    return (String(format: "%02d :", hours), String(format: "%02d :", minutes), String(format: "%02d", seconds))
}

func timeFormattedInDHM(_ totalSeconds: Int) -> (String, String, String) {
    let days: Int = totalSeconds / 86400
    let hours: Int = (totalSeconds % 86400) / 3600
    let minutes: Int = (totalSeconds % 3600) / 60
    return (String(format: "%02d :", days), String(format: "%02d :", hours), String(format: "%02d", minutes))
}

func timeFormattedInDHMFormatted(_ totalSeconds: Int) -> String {
    let days: Int = totalSeconds / 86400
    let hours: Int = (totalSeconds % 86400) / 3600
    let minutes: Int = (totalSeconds % 3600) / 60
    var outputString = ""
    days == 1 ? (outputString += (AppString.day("\(days)")).lowercased()) : (outputString += ("\(days)" + " " + AppString.daysPlaceholder().lowercased()))
    if hours > 0 {
        hours == 1 ? (outputString += (" " + "\(hours)" + " " + AppString.oneHourString()).lowercased()) : (outputString += (" " + "\(hours)" + " " + AppString.hourString()).lowercased())
    }
    if minutes > 0 {
        minutes == 1 ? (outputString += (" " + "\(minutes)" + " " + AppString.minPlaceholder()).lowercased()) : (outputString += (" " + "\(minutes)" + " " + AppString.mins()).lowercased())
    }
    return outputString
}

func timeFormattedInHM(_ mins: Int) -> (Int, Int) {
    let hours: Int = mins / 60
    let minutes: Int = (mins % 60)
    return (hours, minutes)
}

func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}

func getExtandedString(extendedMinutes: Int) -> String? {
    debugPrint("totalMins: \(extendedMinutes)")
    let time = getHrFrom(seconds: extendedMinutes * 60)
    debugPrint("time: \(time)")
    if time.0 > 1 && time.1 > 1 {
        return AppString.extendedHoursAndMins("\(time.0)", "\(time.1)")
    } else if time.0 >= 1 && time.1 <= 0 {
        if time.0 == 1 {
            return AppString.extendedHour("\(time.0)")
        }
        return AppString.extendedHours("\(time.0)")
    }else if time.0 >= 0 && time.1 > 0 {
        if time.0 <= 0 && time.1 > 0 {
            return AppString.extendedMins("\(time.1)")
        } else if time.0 == 1 && time.1 > 0 {
            return AppString.extendedOneHourAndMins("\(time.0)", "\(time.1)")
        }
        return AppString.extendedHoursAndMins("\(time.0)", "\(time.1)")
    }
    return  nil
}

func getHoursMinutesSecondsFromSeconds(seconds:Int) -> String {
    let (hr, min, sec) = secondsToHoursMinutesSeconds (seconds: seconds)
    if hr != 0 {
        if hr == 1  {
            if min == 1 {
                return  AppString.hrs("\(hr)") + " " + AppString.min("\(min)")
            } else if min > 1 {
                return AppString.hrs("\(hr)")  + " " +  AppString.min("\(min)")
            }
            return AppString.hrs("\(hr)")
        } else {
            if min > 1 {
                return AppString.hrs("\(hr)")  + " " +  AppString.min("\(min)")
            } else {
                if min != 0 {
                    if min > 1 {
                        return AppString.hrs("\(hr)")  + " " +  AppString.min("\(min)")
                    } else {
                        return AppString.hrs("\(hr)")  + " " +  AppString.min("\(min)")
                    }
                } else {
                    return AppString.hrs("\(hr)")
                }
            }
        }
    } else if min != 0 {
        if min == 1 {
            return AppString.min("\(min)")
        }else {
            return AppString.min("\(min)")
        }
    } else {
        return "\(sec)" + " " + AppString.sec()
    }
}

func openWebSite(urlString: String) {
    guard let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url, options: [:])
}

func openSettings() {
    if let url = URL(string: UIApplication.openSettingsURLString) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

func getCountryPhoneCode(_ country: String) -> String {
    if let url = Bundle.main.url(forResource: "CountryCodes", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let countryCodes = try decoder.decode([CountryCodes].self, from: data)
            let filteredData = countryCodes.filter { Country in
                Country.code == country
            }
            if filteredData.count > .zero {
                return filteredData[.zero].dialCode ?? ""
            }
        } catch(let error) {
            debugPrint(error)
        }
    }
    return ""
}

func countryName(from countryCode: String) -> String {
    if let name = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: countryCode) {
        return name
    } else {
        return countryCode
    }
}

func updateImageFrame(image:UIImage, scaledToSize newSize:CGSize) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
    image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
    let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return newImage
}

func currencyInputFormatting(input: Float) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currencyAccounting
    formatter.currencySymbol = "$"
    return formatter.string(from: NSNumber(value: input)) ?? ""
}

func getHourMinSecWithFormat(durationInMins: Int) -> String {
    let (h, m ,s) = secondsToHoursMinutesSeconds(seconds: durationInMins*60)
    if h >= 1 {
        if h >= 24 {
            let days = h/24
            return "\(days)" + " " + "\(AppString.daysPlaceholder())" + " " + "\(h%24)" + " " + "\(AppString.hourString())" + " " + "\(m)" + " " + "\(AppString.mins())"
        }
       return m >= 1 ? "\(h)" + " " + "\(AppString.hourString())" + " " + "\(m)" + " " + "\(AppString.mins())" : "\(h)" + " " + "\(AppString.oneHourString())"
    } else {
        return s >= 1 ? "\(m)" + " " + "\(AppString.mins())" + " " + "\(s)" + " " + "\(AppString.sec())" : "\(m)" + " " + "\(AppString.mins())"
    }
}

func isBusinessUser() -> Bool {
    return userManager.userAccountType == UserType.business.rawValue
}

func isPersonalUser() -> Bool {
    return userManager.userAccountType == UserType.personal.rawValue
}

func getTime(date: String?, type: DateOrTime) -> String {
    let date  = getStringDate(date: date ?? "", informat: DateFormat.apiDateFormat.rawValue, outputFormat: "dd/MM/yy,hh:mm a", timeZone: .utc, outputTimeZone: .current).components(separatedBy: ",")
    switch type {
    case .time:
        return date.count > 1 ? date[1] : ""
    default:
        return date.count > 1 ? date[0] : ""
    }
}

func getAttributedString(string: String, color: UIColor, font: UIFont) -> NSMutableAttributedString {
    let attribute = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font]
    return NSMutableAttributedString(string: string, attributes: attribute as [NSAttributedString.Key : Any])
}

func validateUserCheckInBreak() {
    if !userManager.isCheckedIn {
        Alert.showErrorMsg(message: AppString.noCheckInError())
    } else if userManager.isOnBreakTime {
        Alert.showErrorMsg(message: AppString.userIsOnBreakTime())
    }
}

func imageDimenssions(url: String) -> (Int, Int) {
    guard let imgURL = URL(string: url), let imageSource = CGImageSourceCreateWithURL(imgURL as CFURL, nil) else { return (0,0) }
    if let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as Dictionary? {
        let pixelWidth = imageProperties[kCGImagePropertyPixelWidth] as? Int ?? 0
        let pixelHeight = imageProperties[kCGImagePropertyPixelHeight] as? Int ?? 0
        debugPrint("Width: \(pixelWidth), Height: \(pixelHeight)")
        return (pixelWidth, pixelHeight)
    }
    return (0,0)
}

func authenticationWithTouchID(completionHandler: @escaping (Bool) -> Void) {
    let localAuthenticationContext = LAContext()
    localAuthenticationContext.localizedFallbackTitle = AppString.usePasscode()

    var authorizationError: NSError?
    let reason = AppString.requirePasscode()

    if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authorizationError) {
        localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, evaluateError in
            if !success {
                // Failed to authenticate
                guard let error = evaluateError else {
                    return
                }
                showErrorMessageOfBiomatrics(evaluateError: error)
            }
            completionHandler(success)
        }
    } else {
        guard let error = authorizationError else {
            return
        }
        showErrorMessageOfBiomatrics(evaluateError: error)
        completionHandler(false)
    }
}

func showErrorMessageOfBiomatrics(evaluateError: Error) {
    let message: String

    switch evaluateError {
    case LAError.authenticationFailed:
        message = AppString.lAauthenticationFailed()
    case LAError.userFallback, LAError.userCancel: return
    case LAError.biometryNotAvailable:
        message = AppString.lAbiometryNotAvailable()
    case LAError.biometryNotEnrolled:
        message = AppString.lAbiometryNotEnrolled()
    case LAError.biometryLockout:
        message = AppString.lAbiometryLockout()
    default:
        message = AppString.lAnotConfigured()
    }

    DispatchQueue.main.async {
        Alert.showErrorMsg(message: message)
    }
}

func getAvailableSpaces(monthlyPricing: [ParkingLotRateMonthly], spaceEntryModel: MonthlyMultipleSpaceEntryModel ) -> MonthlyMultipleAvailableSpaceModel {
    var availableSpace = MonthlyMultipleAvailableSpaceModel()
    monthlyPricing.forEach { singleItem in
        if let category = singleItem.monthlyCategory, var slot = singleItem.slotsAvailable, let isActive = singleItem.isActive {
            switch category.lowercased() {
            case MonthlyCategoryTypes.monthly_Regular.type.lowercased():
                if isActive {
                    slot = slot - (Int(spaceEntryModel.txtMonthlyGroup ?? AppString.stringZero()) ?? .zero) - (Int(spaceEntryModel.txtMonthlyFleet ?? AppString.stringZero()) ?? .zero)
                    availableSpace.txtMonthly = slot >= .zero ? (singleItem.slotsAvailable == .zero ? AppString.noSpaceTitle() : AppString.spaceLimit("\(slot)")) : (AppString.spaceLimit("\(singleItem.slotsAvailable ?? .zero)"))
                    availableSpace.txtMonthlyColor = slot <= .zero ? AppColor.redColor() : AppColor.paidColor()
                } else {
                    availableSpace.txtMonthly = AppString.currentlyUnavailable()
                    availableSpace.txtMonthlyColor = AppColor.redColor()
                }
            case MonthlyCategoryTypes.monthly_24_7.type.lowercased():
                if isActive {
                    slot = slot - (Int(spaceEntryModel.txtMonthlyReservedGroup ?? AppString.stringZero()) ?? .zero) - (Int(spaceEntryModel.txtMonthlyReservedFleet ?? AppString.stringZero()) ?? .zero)
                    availableSpace.txtMonthlyReserved = slot >= .zero ? (singleItem.slotsAvailable == .zero ? AppString.noSpaceTitle() : AppString.spaceLimit("\(slot)")) : (AppString.spaceLimit("\(singleItem.slotsAvailable ?? .zero)"))
                    availableSpace.txtMonthlyReservedColor = slot <= .zero ? AppColor.redColor() : AppColor.paidColor()
                } else {
                    availableSpace.txtMonthlyReserved = AppString.currentlyUnavailable()
                    availableSpace.txtMonthlyReservedColor = AppColor.redColor()
                }
            case MonthlyCategoryTypes.oversized_Monthly.type.lowercased():
                if isActive {
                    slot = slot - (Int(spaceEntryModel.txtOverSizedMonthlyFleet ?? AppString.stringZero()) ?? .zero) - (Int(spaceEntryModel.txtOverSizedMonthlygroup ?? AppString.stringZero()) ?? .zero)
                    availableSpace.txtOverSizedMonthly = slot >= .zero ? (singleItem.slotsAvailable == .zero ? AppString.noSpaceTitle() : AppString.spaceLimit("\(slot)")) : (AppString.spaceLimit("\(singleItem.slotsAvailable ?? .zero)"))
                    availableSpace.txtOverSizedMonthlyColor = slot <= .zero ? AppColor.redColor() : AppColor.paidColor()
                } else {
                    availableSpace.txtOverSizedMonthly = AppString.currentlyUnavailable()
                    availableSpace.txtOverSizedMonthlyColor = AppColor.redColor()
                }
            case MonthlyCategoryTypes.oversized_Monthly_24_7.type.lowercased():
                if isActive {
                    slot = slot - (Int(spaceEntryModel.txtOverSizedMonthlyReservedFleet ?? AppString.stringZero()) ?? .zero) - (Int(spaceEntryModel.txtOverSizedMonthlyReservedGroup ?? AppString.stringZero()) ?? .zero)
                    availableSpace.txtOverSizedMonthlyReserved = slot >= .zero ? (singleItem.slotsAvailable == .zero ? AppString.noSpaceTitle() : AppString.spaceLimit("\(slot)")) :  (AppString.spaceLimit("\(singleItem.slotsAvailable ?? .zero)"))
                    availableSpace.txtOverSizedMonthlyReservedColor = slot <= .zero ? AppColor.redColor() : AppColor.paidColor()
                } else {
                    availableSpace.txtOverSizedMonthlyReserved = AppString.currentlyUnavailable()
                    availableSpace.txtOverSizedMonthlyReservedColor = AppColor.redColor()
                }
            default:
                break
            }
        }
    }
    return availableSpace
}

func activeSpecificGroupFleetView(textField: UITextField, isActive: Bool) {
    textField.isEnabled = isActive
    textField.backgroundColor = isActive ? .white : AppColor.disableColor() ?? .lightGray
    textField.text = isActive ? textField.text : ""
}

func disableSpecificViewAndComponents(labels: [UILabel], textFields: [UITextField], errorLabel: UILabel) {
    labels.forEach {
        $0.alpha = Constants.disableAlpha
    }
    textFields.forEach {
        $0.isEnabled = false
        $0.backgroundColor = AppColor.disableColor() ?? .lightGray
    }
    errorLabel.textColor = AppColor.redColor()
    errorLabel.text = AppString.currentlyUnavailable()
}

func resetAndHideGroupAndFleetView(textfields: [UITextField], specificView: UIView) {
    textfields.forEach {
        $0.text = ""
    }
    specificView.isHidden = true
}

func getPopoverMenuPosition() -> Int {

    switch UIDevice.current.screenType {
    case .iPhones_5_5s_5c_SE, .iPhones_6_6s_7_8:
        return 65
    default:
        return 90
    }
}

func loadAttachmentImageForChat(urlString: String, token: String, completionHandler: @escaping (UIImage?) -> Void) {
    if let url = URL(string: urlString) {
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode),
                  error == nil else {
                completionHandler(nil)
                return
            }
            completionHandler(UIImage(data: data))
        }
        task.resume()
    }
}

func getSVGImage(icon: String) -> UIImage? {
    let svgImage: SVGKImage = SVGKImage(contentsOf: URL(string: icon))
    let image = svgImage.uiImage
    return image
}

func getPrefixDollar() -> UILabel {
    let prefix = UILabel()
    prefix.text = AppString.dollar()
    prefix.sizeToFit()
    return prefix
}

func getCurrentDate(value: Int, endDate: Date) -> Date {
    return Calendar.current.date(byAdding: .minute, value: value ?? .zero, to: endDate) ?? Date()
}

func getCurrentViewController() -> UIViewController? {
    if let rootController = UIApplication.shared.keyWindow?.rootViewController {
        var currentController: UIViewController? = rootController
        while (currentController?.presentedViewController != nil) {
            currentController = currentController?.presentedViewController
        }
        return currentController
    }
    return nil
}

func findFullDay(day: Int) -> String {
    switch day {
    case 1: return AppString.daySunday()
    case 2: return AppString.dayMonday()
    case 3: return AppString.dayTuesday()
    case 4: return AppString.dayWednesday()
    case 5: return AppString.dayThursday()
    case 6: return AppString.dayFriday()
    case 7: return AppString.daySaturday()
    default: return AppString.notFound()
    }
}

func timeConversion12(time24: String) -> String {
    let dateAsString = time24
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    guard let date = dateFormatter.date(from: dateAsString) else { return ""}
    dateFormatter.dateFormat = "hh:mm a"
    return dateFormatter.string(from: date)
}

//MARK:- getPaymentMethodValue
func getPaymentMethodValue(paymentKey: String) -> String {
    switch paymentKey {
    case PaymentMethods.creditCard.rawValue:
        return PaymentMethods.creditCard.value
    case PaymentMethods.paypalAccount.rawValue:
        return PaymentMethods.paypalAccount.value
    case PaymentMethods.androidPayCard.rawValue:
        return PaymentMethods.androidPayCard.value
    case PaymentMethods.applePayCard.rawValue:
        return PaymentMethods.applePayCard.value
    case PaymentMethods.wallet.rawValue:
        return PaymentMethods.wallet.value
    case PaymentMethods.sms.rawValue:
        return PaymentMethods.sms.value
    case PaymentMethods.cash.rawValue:
        return PaymentMethods.cash.value
    case PaymentMethods.credit.rawValue:
        return PaymentMethods.credit.value
    case PaymentMethods.chargeToRoom.rawValue:
        return PaymentMethods.chargeToRoom.value
    case PaymentMethods.validationUser.rawValue:
        return PaymentMethods.validationUser.value
    case PaymentMethods.payLater.rawValue:
        return PaymentMethods.payLater.value
    case PaymentMethods.payRoll.rawValue:
        return PaymentMethods.payRoll.value
    case PaymentMethods.applePay.rawValue:
        return PaymentMethods.applePay.value
    default: return ""
    }
}

//MARK:- getCategorySpace
func getCategorySpace(slotType: String) -> String {
    switch slotType {
    case SingleMonthlyCategoryTypes.monthly_Regular.categoryTypeValue:
        return SingleMonthlyCategoryTypes.monthly_Regular.slotType
    case SingleMonthlyCategoryTypes.monthly_24_7.categoryTypeValue:
        return SingleMonthlyCategoryTypes.monthly_24_7.slotType
    case SingleMonthlyCategoryTypes.oversized_Monthly.categoryTypeValue:
        return SingleMonthlyCategoryTypes.oversized_Monthly.slotType
    case SingleMonthlyCategoryTypes.oversized_Monthly_24_7.categoryTypeValue:
        return SingleMonthlyCategoryTypes.oversized_Monthly_24_7.slotType
    case SingleMonthlyCategoryTypes.oversized_Regular.categoryTypeValue:
        return SingleMonthlyCategoryTypes.oversized_Regular.slotType
    default: return slotType
        
    }
}

func getAPICategorySpace(slotType: String) -> String {
    switch slotType {
    case SingleMonthlyCategoryTypes.monthly_Regular.slotType:
        return SingleMonthlyCategoryTypes.monthly_Regular.categoryTypeValue
    case SingleMonthlyCategoryTypes.monthly_24_7.slotType:
        return SingleMonthlyCategoryTypes.monthly_24_7.categoryTypeValue
    case SingleMonthlyCategoryTypes.oversized_Monthly.slotType:
        return SingleMonthlyCategoryTypes.oversized_Monthly.categoryTypeValue
    case SingleMonthlyCategoryTypes.oversized_Monthly_24_7.slotType:
        return SingleMonthlyCategoryTypes.oversized_Monthly_24_7.categoryTypeValue
    case SingleMonthlyCategoryTypes.oversized_Regular.slotType:
        return SingleMonthlyCategoryTypes.oversized_Regular.categoryTypeValue
    default: return slotType
        
    }
}

func getHeaderImage() -> UIImage {
    return (ThemeManager.currentTheme() == .themeEnforcement ? AppImage.enforcementDarkLogo() : AppImage.darkLogo()) ?? UIImage()
}

func getUserApplePayCard() -> Bool {
    return StripeAPI.deviceSupportsApplePay()
}

func getExitDateTitle(isMonthly: Bool) -> String {
    return isMonthly ? AppString.renewalDate() : AppString.exitBefore()
}
    
//MARK:- getPaymentMethod
func getPaymentMethod(paymentKey: String) -> String {
    switch paymentKey {
    case PaymentMethods.sms.rawValue:
        return PaymentMethods.sms.value.lowercased()
    case PaymentMethods.cash.rawValue:
        return PaymentMethods.cash.value.lowercased()
    case PaymentMethods.creditDebitCard.rawValue:
        return PaymentMethods.creditDebitCard.value.lowercased()
    case PaymentMethods.chargeToRoom.apiValue:
        return PaymentMethods.chargeToRoom.rawValue
    case PaymentMethods.payLater.apiValue:
        return PaymentMethods.payLater.rawValue
    case PaymentMethods.validationUser.rawValue:
        return PaymentMethods.validationUser.rawValue
    default: return ""
    }
}

func getDateAfter90Days(startingDate: Date) -> Date? {
    return Calendar.current.date(byAdding: .day, value: 90, to: startingDate)
}

func checkCameraPermissionAndAuthorizationStatus() -> Bool {
    switch AVCaptureDevice.authorizationStatus(for: .video) {
    case .authorized:
        return true
    case .notDetermined:
        if let videoCaptureDevice = AVCaptureDevice.default(for: .video) {
            let videoInput: AVCaptureDeviceInput
            do {
                videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
                return true
            } catch {
                Alert.showAlertWithOk(forTitle: AppString.scanNotSupported(), message: AppString.scanNotSupportedDesc(), okTitle: AppString.ok(), okCompletion: nil)
                return false
            }
        }
    case .denied:
        Alert.showAlertWithOk(forTitle: AppString.cameraPermissionDenied(), message: AppString.toEnableAccessTheCamera(), okTitle: AppString.ok(), okCompletion: {
            openSettings()
        })
        return false
    default:
        Alert.showErrorMsg(message: AppString.somethingWentWrong())
        return false
    }
    return false
}

func checkUserCheckInOrUserInBreak() -> Bool {
    if !userManager.isCheckedIn {
        Alert.showErrorMsg(message: AppString.noCheckInError())
        return false
    } else if userManager.isOnBreakTime {
        Alert.showErrorMsg(message: AppString.userIsOnBreakTime())
        return false
    } else {
        return true
    }
}

func checkAndUpdateMonthlyMultipleSpaces(parkingLotRateMonthly: [ParkingLotRateMonthly]? = nil, monthlyVehicle: MonthlyReservationModel? = nil, _ completion: ((MonthlyReservationModel) -> ())? = nil) {
    var groupVehicleInfo = GroupVehicleMonthlyInfo(monthlyCount: 0,
                                                   monthlyReservedCount: 0,
                                                   oversizedMonthlyCount: 0,
                                                   oversizedMonthlyReservedCount: 0)
    var fleetVehicleInfo = FleetVehicleMonthlyInfo(monthlyCount: 0,
                                                   monthlyReservedCount: 0,
                                                   oversizedMonthlyCount: 0,
                                                   oversizedMonthlyReservedCount: 0)
    var vehicleInfo = MonthlyReservationModel(isGroup: true,
                                              isFleet: true,
                                              groupVehicleMonthly: groupVehicleInfo,
                                              fleetVehicleMonthly: fleetVehicleInfo)
    if let monthlyPricing = parkingLotRateMonthly, let vehicleData = monthlyVehicle {
        monthlyPricing.forEach { singleItem in
            if let category = singleItem.monthlyCategory, let isCategoryActive = singleItem.isActive, let isFleetActive = singleItem.isForFleet {
                switch category.lowercased() {
                case MonthlyCategoryTypes.monthly_Regular.type.lowercased():
                    groupVehicleInfo.monthly = isCategoryActive ? vehicleData.groupVehicleInfo?.monthly : 0
                    fleetVehicleInfo.monthly = isCategoryActive ? isFleetActive ? vehicleData.fleetVehicleInfo?.monthly : 0 : 0
                case MonthlyCategoryTypes.monthly_24_7.type.lowercased():
                    groupVehicleInfo.monthlyReserved = isCategoryActive ? vehicleData.groupVehicleInfo?.monthlyReserved : 0
                    fleetVehicleInfo.monthlyReserved = isCategoryActive ? isFleetActive ? vehicleData.fleetVehicleInfo?.monthlyReserved : 0 : 0
                case MonthlyCategoryTypes.oversized_Monthly.type.lowercased():
                    groupVehicleInfo.oversizedMonthly = isCategoryActive ? vehicleData.groupVehicleInfo?.oversizedMonthly : 0
                    fleetVehicleInfo.oversizedMonthly = isCategoryActive ? isFleetActive ? vehicleData.fleetVehicleInfo?.oversizedMonthly : 0 : 0
                case MonthlyCategoryTypes.oversized_Monthly_24_7.type.lowercased():
                    groupVehicleInfo.oversizedMonthlyReserved = isCategoryActive ? vehicleData.groupVehicleInfo?.oversizedMonthlyReserved : 0
                    fleetVehicleInfo.oversizedMonthlyReserved = isCategoryActive ? isFleetActive ? vehicleData.fleetVehicleInfo?.oversizedMonthlyReserved : 0 : 0
                default:break
                }
            }
        }
        let mainVehicleData = MonthlyReservationModel(isGroup: vehicleData.isGroupVehicleSelected,
                                                      isFleet: vehicleData.isFleetVehicleSelected,
                                                      groupVehicleMonthly: groupVehicleInfo,
                                                      fleetVehicleMonthly: fleetVehicleInfo)
        vehicleInfo = mainVehicleData
    }
    completion?(vehicleInfo)
}

func formatAmount(amount: String, isTextWithoutMinimumFractionDigits: Bool = false) -> String {
    let formattedNumber = NumberFormatter()
    formattedNumber.numberStyle = .decimal
    if !isTextWithoutMinimumFractionDigits {
        formattedNumber.minimumFractionDigits = 2
    }
    guard let formattedAmount = formattedNumber.string(from: NSNumber(value: Double(amount) ?? 0)) else { return "0.00" }
    return formattedAmount
}

func formatTextfieldAmount(textField: UITextField, range: NSRange, string: String) -> Bool {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "en_US")
    formatter.usesGroupingSeparator = true
    formatter.decimalSeparator = "."
    formatter.groupingSeparator = ","
    formatter.numberStyle = NumberFormatter.Style.decimal
    formatter.maximumFractionDigits = 6
    let oldText = textField.text ?? ""
    let oldTextNS = oldText as NSString
    let newText = oldTextNS.replacingCharacters(in: range, with: string)
    if newText.count > 12 {
        return false
    }
    if string == "." {
        if oldText.count == 11 {
            return false
        }
    }
    var wasBackspace = false
    if let char = string.cString(using: String.Encoding.utf8) {
        let compareToBackspace = strcmp(char, "\\b")
        if (compareToBackspace == -92) {
            wasBackspace = true
        }
    }
    
    let strippedNewText = newText.replacingOccurrences(of: formatter.groupingSeparator, with: "")
    if strippedNewText == "-" {
        return true
    }
    
    if strippedNewText.lengthOfBytes(using: .utf8) == 0 {
        return true
    } else {
        guard let newNumber = Double(strippedNewText) as? NSNumber else {
            return false
        }
        let formattedNumber = formatter.string(from: newNumber) ?? ""
        let formattedNumberWithoutThousandsGroups = formattedNumber.replacingOccurrences(of: formatter.groupingSeparator, with: "")
        guard let decimal = Decimal(string: formattedNumberWithoutThousandsGroups) else {
            return false
        }
        
        if decimal.significantFractionalDecimalDigits > 2 {
            return false
        }
        var numGroupersBeforeChange = 0
        var numCharsBeforeChange = 0
        var incrementIndex = 0
        for index in oldText.indices {
            incrementIndex += 1
            let char = oldText[index]
            if String(char) == formatter.groupingSeparator {
                numGroupersBeforeChange += 1
            } else {
                numCharsBeforeChange += 1
            }
        }
        
        var numGroupersAfterChange = 0
        var numCharsAfterChange = 0
        incrementIndex = 0
        for index in formattedNumber.indices {
            let char = formattedNumber[index]
            if String(char) == formatter.groupingSeparator {
                numGroupersAfterChange += 1
            } else {
                numCharsAfterChange += 1
            }
            if numCharsBeforeChange == numCharsAfterChange {
                break
            }
            incrementIndex += 1
        }
        let numGroupersAdded = numGroupersAfterChange - numGroupersBeforeChange
        let removedZero = (formattedNumber.count - numGroupersAfterChange) - strippedNewText.count
        var updatedText: String = formattedNumber
        switch abs(removedZero) {
        case 1:
            if string != "0" && !(updatedText.contains(".")) {
                updatedText = updatedText.appending(".")
            } else if decimal.significantFractionalDecimalDigits == 2 {
                updatedText = updatedText.appending("")
            } else {
                updatedText = updatedText.appending("0")
            }
        case 2:
            updatedText = !(updatedText.contains(".")) ? updatedText.appending(".0") : updatedText.appending("0")
        case 3,4:
            updatedText = updatedText.appending(".00")
        default:
            break
        }
        textField.text = updatedText
        var cursorOffset = range.location + numGroupersAdded
        let numCharsAddedByUserChange = wasBackspace ? 0 : string.count
        cursorOffset += numCharsAddedByUserChange
        
        if let newPosition = textField.position(from: textField.beginningOfDocument, offset: cursorOffset) {
            let newSelectedRange = textField.textRange(from: newPosition, to: newPosition)
            textField.selectedTextRange = newSelectedRange
        }
        return false
    }
}

func isNotificationConfigurationEnabled() {
    let current = UNUserNotificationCenter.current()
    current.getNotificationSettings(completionHandler: { permission in
        userManager.isRemoteNotificationEnabled = permission.authorizationStatus == .authorized
    })
}
