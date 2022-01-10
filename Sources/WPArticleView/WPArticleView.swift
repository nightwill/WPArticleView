import Foundation
import SwiftSoup
import SwiftUI

public struct WPArticleView<Content: View>: View {
    
    private let content: Content
        
    public init?<T, I, V>(
        htmlBody: String,
        @ViewBuilder list: @escaping ([AnyView]) -> Content,
        @ViewBuilder text: @escaping (String) -> T,
        @ViewBuilder image: @escaping (URL) -> I,
        @ViewBuilder video: @escaping (URL) -> V
    ) where T: View, I: View, V: View {
        guard let doc = try? SwiftSoup.parseBodyFragment(htmlBody), let body = doc.body() else {
            return nil
        }
        let blocks: [AnyView] = body.children().compactMap { element in
            if let view = VideoView<V>(element, video: video) {
                return view.eraseToAnyView()
            } else if let view = ImageView(element, image: image) {
                return view.eraseToAnyView()
            } else if let view = ParagraphView(element, text: text) {
                return view.eraseToAnyView()
            } else {
                return nil
            }
        }
        self.content = list(blocks)
    }
    
    public var body: some View {
        content
    }
    
}
