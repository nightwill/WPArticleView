import Foundation
import SwiftSoup
import SwiftUI

public struct WPArticleView<Content: View>: View {
    
    private let content: Content
        
    public init?<T, I>(
        htmlBody: String,
        @ViewBuilder list: @escaping ([AnyView]) -> Content,
        @ViewBuilder text: @escaping (String) -> T,
        @ViewBuilder image: @escaping (URL) -> I
    ) where T: View, I: View {
        guard let doc = try? SwiftSoup.parseBodyFragment(htmlBody), let body = doc.body() else {
            return nil
        }
        let blocks: [AnyView] = body.children().compactMap { element in
            switch element.tagName() {
            case ParagraphView<T>.tag:
                return ParagraphView(element, text: text)?.eraseToAnyView()
            case FigureView<I>.tag:
                return FigureView(element, image: image)?.eraseToAnyView()
            default:
                return nil
            }
        }
        self.content = list(blocks)
    }
    
    public var body: some View {
        content
    }
    
}
