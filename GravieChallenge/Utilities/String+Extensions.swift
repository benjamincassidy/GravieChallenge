//
//  String+Extensions.swift
//  GravieChallenge
//
//  Created by Benjamin Cassidy on 1/28/23.
//

import Foundation

extension String {
    func toHtmlAttributedString() -> AttributedString? {
        let nsAttributedString = try? NSMutableAttributedString(
            data: Data(description.utf8),
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        )
        
        guard let nsAttributedString else { return nil }
        
        nsAttributedString
            .enumerateAttributes(in: NSRange(location: 0, length: nsAttributedString.length), options: [])
        { attributes, range, stop in
            nsAttributedString.removeAttribute(.link, range: range)
            nsAttributedString.removeAttribute(.foregroundColor, range: range)
            nsAttributedString.removeAttribute(.underlineStyle, range: range)
        }
        
        guard let attributedString = try? AttributedString(nsAttributedString, including: \.uiKit) else {
            return nil
        }
        
        return attributedString
    }
}
