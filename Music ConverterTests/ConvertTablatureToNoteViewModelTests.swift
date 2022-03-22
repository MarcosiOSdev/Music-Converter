//
//  Music_ConverterTests.swift
//  Music ConverterTests
//
//  Created by marcos.felipe.souza on 25/02/22.
//

import XCTest
@testable import Music_Converter

class ConvertTablatureToNoteViewModelTests: XCTestCase {

    var sut: ConvertTablatureToNoteViewModel!
    
    override func setUp() {
        super.setUp()
        sut = ConvertTablatureToNoteViewModel()
    }
    
    func test_default_parameters_all_zero() throws {
        XCTAssertEqual(sut.tablatureNoteSlider, 0)
        XCTAssertEqual(sut.tablatureNoteText, "0")
        XCTAssertEqual(sut.tablatureNote, 0)
        XCTAssertEqual(sut.convertedNote, "")
    }
    
    func test_choose_note_by_slider_should_be_convert_note() {
        XCTAssertEqual(sut.tablatureNoteSlider, 0)
        XCTAssertEqual(sut.noteSelected, 0)
        
        sut.onAppear()
        sut.tablatureNoteSlider = 1.0
        sut.noteSelected = 0
        
        XCTAssertEqual("A#", sut.convertedNote)
    }
    
    func test_choose_note_by_text_should_be_convert_note() {
        XCTAssertEqual(sut.tablatureNoteSlider, 0)
        XCTAssertEqual(sut.noteSelected, 0)
        
        sut.onAppear()
        sut.tablatureNoteText = "2"
        
        XCTAssertEqual("B", sut.convertedNote)
    }
    
    func test_choose_note_by_wrong_text_should_be_same_init_value() {
        XCTAssertEqual(sut.tablatureNoteSlider, 0)
        XCTAssertEqual(sut.noteSelected, 0)
        
        sut.onAppear()
        sut.tablatureNoteText = "AB"
        
        XCTAssertEqual("A", sut.convertedNote)
    }
    
    func test_choose_note_by_text_below_min_value_should_be_same_init_value() {
        XCTAssertEqual(sut.tablatureNoteSlider, 0)
        XCTAssertEqual(sut.noteSelected, 0)
        
        sut.onAppear()
        sut.tablatureNoteText = "-1"
        
        XCTAssertEqual("A", sut.convertedNote)
    }
    func test_choose_note_by_text_above_max_value_should_be_same_init_value() {
        XCTAssertEqual(sut.tablatureNoteSlider, 0)
        XCTAssertEqual(sut.noteSelected, 0)
        
        sut.onAppear()
        sut.tablatureNoteText = "\(sut.maxPosition + 1)"
        
        XCTAssertEqual("A", sut.convertedNote)
    }
    
    func test_choose_note_by_slider_with_above_12_houses_should_be_convert_note() {
        XCTAssertEqual(sut.tablatureNoteSlider, 0)
        XCTAssertEqual(sut.noteSelected, 0)
        
        sut.onAppear()
        sut.tablatureNoteSlider = 13.5
        sut.noteSelected = 0
        
        XCTAssertEqual("A#", sut.convertedNote)
    }
}

