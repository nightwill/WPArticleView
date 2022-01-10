import Foundation
import SwiftSoup
import SwiftUI

struct ImageView<Content: View>: View {
    
    private let content: Content
    
    init?(_ element: Element, @ViewBuilder image: @escaping (URL) -> Content) {
        guard element.tagName() == "figure" else {
            return nil
        }
        guard let imageElement = try? element.getElementsByTag("img").first(), let src = try? imageElement.attr("src"), let url = URL(string: src) else {
            return nil
        }
        
        self.content = image(url)
    }
    
    var body: some View {
        content
    }
    
}
