# WPArticleView

## Installation

```swift
...
dependencies: [
    .package(url: "https://github.com/nightwill/WPArticleView.git", from: "0.1.0"),
],
targets: [
    .target( name: "YourTarget", dependencies: ["WPArticleView"]),
]
...
```

## Usage:

```swift
import SwiftUI
import WPArticleView

struct ContentView: View {

    let htmlText: String
        
    var body: some View {
        WPArticleView(htmlBody: htmlText) { blocks in
            
            List(blocks.indices, id: \.self) { id in
                blocks[id]
            }
            
        } text: { attributedText in
            
            Text(attributedText)
            
        } image: { imageURL in
            
            AsyncImage(url: imageURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            
        } video: { videoURL in
                    
            VideoPlayer(player: AVPlayer(url: videoURL))
                    .frame(minHeight: 400)
                    
        }
    }
    
}
```
### Or using `ScrollView`:
```swift
import SwiftUI
import WPArticleView

struct ContentView: View {
        
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                WPArticleView(htmlBody: htmlText) { blocks in
                    
                    ForEach(blocks.indices, id: \.self) { id in
                        blocks[id]
                    }
                    
                    
                } text: { attributedText in
                    
                    Text(attributedText)
                    
                } image: { imageURL in
                    
                    AsyncImage(url: imageURL) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    }
                    
                } video: { videoURL in
                    
                    VideoPlayer(player: AVPlayer(url: videoURL))
                        .frame(minHeight: 400)
                    
                }
            }
            .padding(24)
        }
        
    }
    
}
```
