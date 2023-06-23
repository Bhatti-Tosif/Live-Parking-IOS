//
//  APIManager.swift
//  TagBDemo
//
//  Created by Pooja Gupta on 18/09/20.
//  Copyright © 2020 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Alamofire
import UIKit
import Reachability
import SSAppUpdater

let documentCache = NSCache<NSString, NSURL>()

class APIManager: NetworkManger {
    
    // MARK: Vars & Lets
    let reachability = try? Reachability()
    private let sessionManager: SessionManager
    private let retrier: APIManagerRetrier
    private let adapter: APIManagerAdapter
    static let errorCodeList =  [400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 421, 422, 423, 424, 425, 426, 427, 428, 429, 431, 451, 500, -1009, -1001]
    let imageCache = NSCache<NSString, UIImage>()
    
    // MARK: Public methods
    static var shared: APIManager {
        return APIManager(sessionManager: SessionManager(), retrier: APIManagerRetrier(), adapter: APIManagerAdapter())
    }
    
    //MARK:- disposePreviousApiCall
    func disposePreviousApiCall() {
        self.sessionManager.session.getAllTasks{ (tasks) in
            tasks.forEach {$0.cancel() }
        }
    }
    
    func call(type: RequestItemsType, params: Parameters?, handler: @escaping (Swift.Result<(), CustomError>) -> Void) {
        if reachability?.connection != .unavailable {
            self.sessionManager.request(type.url,
                                        method: type.httpMethod,
                                        parameters: params,
                                        encoding: type.encoding,
                                        headers: type.headers).validate().responseJSON { (data) in
                                            if self.handleResponseCode(res: data) {
                                                switch data.result {
                                                case .success:
                                                    handler(.success(()))
                                                case .failure:
                                                    handler(.failure(self.parseApiError(dataResponse: data)))
                                                }
                                            } else {
                                                handler(.failure(self.parseApiError(dataResponse: data)))
                                            }
            }
        } else {
            handler(.failure(CustomError(title: R.string.localizable.appName(), body: APIError.noInternet)))
        }
    }
    
    func call<T>(type: RequestItemsType, params: Parameters? = nil, handler: @escaping (Swift.Result<T, CustomError>) -> Void) where T: Codable {
        if reachability?.connection != .unavailable {
//            debugPrint("url: \(type.url)")
//            debugPrint("params: \(String(describing: params))")
//            debugPrint("headers: \(String(describing: type.headers))")
            self.sessionManager.request(type.url,
                                        method: type.httpMethod,
                                        parameters: params,
                                        encoding: type.encoding,
                                        headers: type.headers).validate().responseJSON { (data) in
                                            if self.handleResponseCode(res: data) {
                                                do {
                                                    guard let jsonData = data.data else {
                                                        throw CustomError(title: APIError.defaultAlertTitle, body: APIError.noData)
                                                    }
                                                    let result = try JSONDecoder().decode(BaseJsonModel<T>.self, from: jsonData)
//                                                    debugPrint("response: \(result.data)")
                                                    handler(.success(result.data))
                                                    self.resetNumberOfRetries()
                                                } catch {
                                                    if let error = error as? CustomError {
                                                        debugPrint(error)
                                                        return handler(.failure(error))
                                                    }
                                                    debugPrint(error)
                                                    handler(.failure(self.parseApiError(dataResponse: data)))
                                                }
                                            } else {
                                                handler(.failure(self.parseApiError(dataResponse: data)))
                                            }
            }
        } else {
            handler(.failure(CustomError(title: R.string.localizable.appName(), body: APIError.noInternet)))
        }
    }
    
//    func callStripe<T>(type: RequestItemsType, params: Parameters? = nil, handler: @escaping (Swift.Result<T, CustomError>) -> Void) where T: Codable {
//        if reachability?.connection ?? .unavailable != .unavailable {
//            self.sessionManager.request(type.url,
//                                        method: type.httpMethod,
//                                        parameters: params,
//                                        encoding: URLEncoding.httpBody,
//                                        headers: type.headers).validate().responseJSON { (data) in
//                                            if self.handleResponseCode(res: data) {
//                                                do {
//                                                    guard let jsonData = data.data else {
//                                                        throw CustomError(title: APIError.defaultAlertTitle, body: APIError.noData)
//                                                    }
//                                                    let result = try JSONDecoder().decode(T.self, from: jsonData)
//                                                    handler(.success(result))
//                                                    self.resetNumberOfRetries()
//                                                } catch {
//                                                    if let error = error as? CustomError {
//                                                        return handler(.failure(error))
//                                                    }
//                                                    handler(.failure(self.parseStripeApiError(dataResponse: data)))
//                                                }
//                                            } else {
//                                                handler(.failure(self.parseStripeApiError(dataResponse: data)))
//                                            }
//                                        }
//        } else {
//            handler(.failure(CustomError(title: R.string.localizable.appName(), body: APIError.noInternet)))
//        }
//    }
//
//    func callForImageUpload (type: RequestItemsType, mimeType: String? = nil, imageData: Data, params: Parameters? = nil, handler: @escaping (Swift.Result<Bool, CustomError>) -> Void) {
//
//        if reachability?.connection != .unavailable {
//            self.sessionManager.upload(imageData, to: type.url, method: .put, headers: type.headers).validate().responseJSON { (data) in
//                debugPrint(data)
//                if self.handleResponseCode(res: data) {
//                    handler(.success(true))
//                } else {
//                    handler(.failure(self.parseApiError(dataResponse: data)))
//                }
//            }
//        } else {
//            handler(.failure(CustomError(title: R.string.localizable.appName(), body: APIError.noInternet)))
//        }
//    }
    
//    func uploadImage<T: Codable>(type: RequestItemsType, files: [UploadFileRequest], params: Parameters? = nil, handler: @escaping (Swift.Result<T, CustomError>) -> Void) {
//        if reachability?.connection != .unavailable {
//            Alamofire.upload(multipartFormData: { (multipartFormData) in
//                files.forEach { (file) in
//                    multipartFormData.append(file.fileData, withName: file.paramName, fileName: file.fileName, mimeType: file.mimeType.rawValue)
//                }
//                if let params = params {
//                    for (key, value) in params {
//                        if let value = value as? Bool, let data = try? JSONEncoder().encode(value) {
//                            multipartFormData.append(data, withName: key, mimeType: MimeType.applicationJSON.rawValue)
//                        } else if let desc = (value as AnyObject).description {
//                            let data = Data(desc.utf8)
//                            multipartFormData.append(data, withName: key, mimeType: MimeType.jpegMimeTypeImage.rawValue)
//                        }
//                    }
//                }
//            }, usingThreshold: UInt64.init(), to: type.url, method: type.httpMethod, headers: type.headers, encodingCompletion: { (encodingResult) in
//                switch encodingResult {
//                case .success(let upload, _, _):
//                    upload.responseJSON { [weak self] response in
//                        guard let uSelf = self else { return }
//                        do {
//                            guard let jsonData = response.data else {
//                                throw CustomError(title: APIError.defaultAlertTitle, body: APIError.noData)
//                            }
//                            let result = try JSONDecoder().decode(BaseJsonModel<T>.self, from: jsonData)
//                            handler(.success(result.data))
//                            uSelf.resetNumberOfRetries()
//                        } catch {
//                            if let error = error as? CustomError {
//                                return handler(.failure(error))
//                            }
//                            handler(.failure(uSelf.parseApiError(dataResponse: response)))
//                        }
//                    }
//                case .failure(let encodingError):
//                    handler(.failure(CustomError(title: AppString.appName(), body: encodingError.localizedDescription)))
//                }
//            })
//        } else {
//            handler(.failure(CustomError(title: AppString.appName(), body: APIError.noInternet)))
//        }
//    }
//
//    /// Download file to specific URL
//    /// - Parameters:
//    ///   - fileUrl: File Path
//    ///   - handler: Handler
//    internal func downloadFile(filePath: String, handler: @escaping (Swift.Result<(NSURL, String), CustomError>) -> Void) {
//        if let cachedURL = documentCache.object(forKey: filePath as NSString) {
//            handler(.success((cachedURL, filePath)))
//            return
//        }
//        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
//        Alamofire.download(filePath, to: destination)
//            .response(completionHandler: { (downloadResponse) in
//                if let url = downloadResponse.destinationURL {
//                    debugPrint("Downloaded PDF: \(url)")
//                    userManager.downlodedUrlString = "\(url)"
//                    documentCache.setObject(url as NSURL, forKey: filePath as NSString)
//                    handler(.success((url as NSURL, filePath)))
//                } else  if let error = downloadResponse.error {
//                    handler(.failure(CustomError(title: AppString.appName(), body: error.localizedDescription)))
//                }
//            })
//    }

    // MARK: Private methods
    
    private func resetNumberOfRetries() {
        self.retrier.numberOfRetries = 0
    }
    
    /// Handle response code
    ///
    /// - Parameter res: api response
    /// - Returns: returns true if response status is sucess else false
    private func handleResponseCode(res: DataResponse<Any>?) -> Bool {
        var isSuccess: Bool = false
        
        guard let dataResponse = res else {
            return isSuccess
        }
        guard let response = dataResponse.response else {
            return isSuccess
        }
        
        switch response.statusCode {
        case 200...300:
            isSuccess = true
        case 404:
            isSuccess = false
        case 426:
            SSAppUpdater.shared.performCheck(isForceUpdate: true, updateAlertFrequency: .always, showDefaultAlert: true) { _ in }
        default: break
        }
        
        return isSuccess
    }
    
    // MARK: Initialization
    
    init(sessionManager: SessionManager, retrier: APIManagerRetrier, adapter: APIManagerAdapter) {
        self.sessionManager = sessionManager
        self.retrier = retrier
        self.sessionManager.retrier = self.retrier
        self.adapter = adapter
        self.sessionManager.adapter = adapter
    }
    
}
