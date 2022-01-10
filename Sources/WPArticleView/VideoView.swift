import Foundation
import SwiftSoup
import SwiftUI

struct VideoView<Content: View>: View {
    
    private let content: Content
    
    init?(_ element: Element, @ViewBuilder video: @escaping (URL) -> Content) {
        guard element.tagName() == "figure" else {
            return nil
        }
        guard let imageElement = try? element.getElementsByTag("video").first(), let src = try? imageElement.attr("src"), let url = URL(string: src) else {
            return nil
        }
        
        self.content = video(url)
    }
    
    var body: some View {
        content
    }
    
}
