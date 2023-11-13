import Foundation
import SwiftSoup
import SwiftUI

struct ParagraphView<Content: View>: View {
    
    private let content: Content
    
    init?(_ element: Element, @ViewBuilder text: @escaping (String) -> Content) {
        guard element.tagName() == "p" else {
            return nil
        }
        guard let attributedText = try? element.text() else {
            return nil
        }
        self.content = text(attributedText)
    }

    @available(macOS 12, iOS 15, *)
    init?(_ element: Element, @ViewBuilder attributedText: @escaping (AttributedString) -> Content) {
        guard element.tagName() == "p" else {
            return nil
        }

        guard
            let html = try? element.outerHtml(),
            let nsAttributedString = try? NSAttributedString(data: Data(html.utf8), options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        else { return nil }

        let attributedString = AttributedString(nsAttributedString)
        self.content = attributedText(attributedString)
    }

    var body: some View {
        content
    }
    
}
