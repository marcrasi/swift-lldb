// main.swift
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2015 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
// -----------------------------------------------------------------------------

import Foundation

let ptr = UnsafeMutablePointer<UInt8>.init(allocatingCapacity: 10)
print(ptr)  // breakpoint
ptr[11] = 42

print("done")
