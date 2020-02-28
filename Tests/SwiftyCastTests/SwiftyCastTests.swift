//
//  SwiftyCastTests.swift
//  SwiftyCastTests
//
//  Copyright © 2020 SomeRandomiOSDev. All rights reserved.
//

import SwiftyCast
import XCTest

class SwiftyCastTests: XCTestCase {

    func testBridgingCastToUnmanaged() {
        let nonnilObject: AnyObject = NSObject()
        let nullableObject: AnyObject? = nonnilObject
        let nullObject: AnyObject? = nil

        let unsafePointer1 = unsafeBridgingCast(nonnilObject)
        let unsafePointer2 = unsafeBridgingCast(nullableObject)
        let unsafePointer3 = unsafeBridgingCast(nullObject)

        XCTAssertNotNil(unsafePointer2)
        XCTAssertEqual(unsafePointer1, unsafePointer2)
        XCTAssertNil(unsafePointer3)

        let object1: AnyObject = unsafeBridgingCast(unsafePointer1)
        let object2: AnyObject? = unsafeBridgingCast(unsafePointer2)
        let object3: AnyObject? = unsafeBridgingCast(unsafePointer3)

        XCTAssertTrue(nonnilObject === object1)
        XCTAssertTrue(nullableObject === object2)
        XCTAssertNil(object3)
    }

    func testBridgingRetainCast() {
        do {
            var object: AnyObject? = NSObject()
            weak var weakObject: AnyObject? = object

            let pointer = unsafeBridgingRetain(object)
            XCTAssertNotNil(pointer)

            autoreleasepool { object = nil }

            // We manually retained the object, it shouldn't have been deallocated
            XCTAssertNotNil(weakObject)

            object = unsafeBridgingRelease(pointer)
            XCTAssertNotNil(object)

            autoreleasepool { object = nil }

            // We manually released the object, it should now be deallocated
            XCTAssertNil(weakObject)
        }

        do {
            weak var weakObject: AnyObject?

            autoreleasepool {
                let object = NSObject()
                // object.retainCount == 1
                weakObject = object
                // object.retainCount == 1

                _ = unsafeBridgingRetain(object)
                // object.retainCount == 2
            }
            // object.retainCount == 1

            XCTAssertNotNil(weakObject)

            autoreleasepool {
                let pointer = unsafeBridgingCast(weakObject)
                XCTAssertNotNil(pointer)

                // object.retainCount == 1

                // swiftlint:disable force_unwrapping
                let _: AnyObject = unsafeBridgingRelease(pointer!)
                // swiftlint:enable force_unwrapping
            }
            // object.retainCount == 0

            XCTAssertNil(weakObject)
        }

        do {
            let nullObject: AnyObject? = nil
            let pointer = unsafeBridgingRetain(nullObject)

            XCTAssertNil(pointer)

            let object: AnyObject? = unsafeBridgingRelease(pointer)

            XCTAssertNil(object)
        }
    }

    func testBridingCastBlocks() {
        let nonnilObject: AnyObject = NSObject()
        let nullableObject: AnyObject? = nonnilObject
        let nullObject: AnyObject? = nil

        withUnsafeBridgingCast(nonnilObject) { pointer in
            withUnsafeBridgingCast(pointer) { (object: AnyObject) in
                XCTAssertTrue(nonnilObject === object)
            }
        }

        withUnsafeBridgingCast(nullableObject) { pointer in
            XCTAssertNotNil(pointer)

            withUnsafeBridgingCast(pointer) { (object: AnyObject?) in
                XCTAssertNotNil(object)
                XCTAssertTrue(nullableObject === object)
            }
        }

        withUnsafeBridgingCast(nullObject) { pointer in
            XCTAssertNil(pointer)

            withUnsafeBridgingCast(pointer) { (object: AnyObject?) in
                XCTAssertNil(object)
            }
        }
    }

    // MARK: Private Methods

    #if os(Linux)
    private func autoreleasepool<Result>(invoking body: () throws -> Result) rethrows -> Result {
        return try body()
    }
    #endif
}
