//
//  String+stripHtml.swift
//  MPDemo
//
//  Created by Ray Berry on 24/08/2023.
//

import Foundation

extension String {
    
    /// Removes HTML tags
    /// - Returns: string with HTML tags removed
    func stripOutHtml() -> String? {
        do {
            guard let data = self.data(using: .unicode) else {
                return nil
            }
            let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            return attributed.string
        } catch {
            return nil
        }
    }
}
