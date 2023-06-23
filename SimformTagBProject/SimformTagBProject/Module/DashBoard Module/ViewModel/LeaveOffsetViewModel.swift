//
//  LeaveOffsetViewModel.swift
//  SimformTagBProject
//
//  Created by Tosif Bhatti on 09/06/23.
//

import Foundation

class LeaveOffsetViewModel: NSObject {
    
    //MARK: Properties
    internal let apiSuccess = Dynamic<Void>(())
    internal var leaveOffsetData = DynamicArray<InstituteUserLeaveRequestList>([])
    
    //MARK: - Function
    func fatchLeaveOffsetData() {
        apiManager.call(type: .leaveOffset(institutId: 151, size: 10, page: 1)) { [weak self] (result: Result<LeaveOffSetResponseModel, CustomError>) in
            guard let uSelf = self else { return }
            switch result {
            case .success(let leaveData):
                guard let instituteData = leaveData.instituteUserLeaveRequestList else { return }
                uSelf.leaveOffsetData.value = instituteData
                uSelf.apiSuccess.fire()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    //MARK: Practice for URL Session.
    func fatchLeaveDataThroughURLSession() {
        let url = RequestItemsType.leaveOffset(institutId: 151, size: 10, page: 1).url
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("1.0.3", forHTTPHeaderField: "appversion")
        urlRequest.setValue("ios", forHTTPHeaderField: "plateform")
        urlRequest.setValue("Bearer \(userManager.accessToken)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, respons, error in
            guard let uSelf = self else { return }
            guard let data = data else {
                debugPrint("Data is Nil")
                return
            }
            guard error == nil else {
                debugPrint("error")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(LeaveOffsetBaseResponseModel.self, from: data)
                uSelf.leaveOffsetData.value = decodedData.data?.instituteUserLeaveRequestList ?? []
                uSelf.apiSuccess.fire()
            } catch {
                debugPrint("Error During Json SerialIzation\(error.localizedDescription)")
            }
        }.resume()
    }
}
