//
//  MockUrlProtocol.swift
//  LocFlix
//
//  Created by Puneet Mahajan on 25/08/25.
//

import Foundation

class MockURLProtocol: URLProtocol {
    static var mockResponseData: Data?
    static var mockError: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockURLProtocol.mockError {
            self.client?.urlProtocol(self, didFailWithError: error)
        } else if let data = MockURLProtocol.mockResponseData {
            self.client?.urlProtocol(self, didLoad: data)
            self.client?.urlProtocolDidFinishLoading(self)
        }
    }
    
    override func stopLoading() {}
}
