//
//  Music_ConverterUITests.swift
//  Music ConverterUITests
//
//  Created by marcos.felipe.souza on 25/02/22.
//

import XCTest

class Music_ConverterUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_flow_app() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        app.buttons["Converter Tablatura para Nota"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.sliders["0"].adjust(toNormalizedSliderPosition: 0.8)
        tablesQuery.buttons["Nota"].tap()
        tablesQuery.switches["D"].tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Music Converter"].tap()
        
    }
}
