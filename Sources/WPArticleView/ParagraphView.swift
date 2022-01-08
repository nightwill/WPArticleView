import Foundation
import SwiftSoup
import SwiftUI

struct ParagraphView<Content: View>: View {
    
    static var tag: String { "p" }
    
    private let content: Content
    
    init?(_ element: Element, @ViewBuilder text: @escaping (String) -> Content) {
        guard element.tagName() == Self.tag else {
            return nil
        }
        guard let attributedText = try? element.text() else {
            return nil
        }
        self.content = text(attributedText)
    }
    
    var body: some View {
        content
    }
    
}
