//
//  NetworkTest.swift
//  NewslyTests
//
//  Created by SOHA on 8/16/21.
//
import XCTest
@testable import Newsly
class NetworkTest: XCTestCase {

    var apiService: NewsAPIProtocol?
    var newViewModel : newsViewModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiService = NewsAPI()
        newViewModel = newsViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiService = nil
        newViewModel = nil
    }

    func testGetNews(){
        let expObj = expectation(description: "wait for response")
        newViewModel?.newsObservable?.asObservable().subscribe{(articleElement) in
            expObj.fulfill()

             XCTAssertEqual( articleElement.element!.count, 20)
        }
        newViewModel?.getNewsTechnology()

        waitForExpectations(timeout: 5)
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
