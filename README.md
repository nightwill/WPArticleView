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
struct ContentView: View {
        
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
            
        }
    }
    
}
```
