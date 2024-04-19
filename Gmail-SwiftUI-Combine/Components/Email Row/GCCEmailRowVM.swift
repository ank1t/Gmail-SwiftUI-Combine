//
//  GCCEmailRowVM.swift
//  Gmail-SwiftUI-Combine
//
//  Created by Singh, Ankit on 2024-04-16
//
        
import Foundation
import SwiftUI

struct GCCEmailRowVM: Identifiable {
//    var image: Image?
    let senderList: [String] = ["Google", "me"]
    let subject: String = "Hello from Gmail"
    let message: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
    let attachments: [String] = ["Attachment 1", "Attachment 2"]
    let date: String = "Apr 12"
    let id: UUID = UUID()
}
