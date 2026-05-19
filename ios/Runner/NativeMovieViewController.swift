import SwiftUI
import UIKit

class NativeMovieViewController: UIHostingController<NativeMovieViewController.ContentView> {
  init(title: String, posterUrl: String, rating: Double) {
    super.init(rootView: ContentView(title: title, posterUrl: posterUrl, rating: rating))
    modalPresentationStyle = .fullScreen
  }

  @MainActor required dynamic init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  struct ContentView: View {
    let title: String
    let posterUrl: String
    let rating: Double

    @Environment(\.dismiss) private var dismiss

    var body: some View {
      NavigationStack {
        ScrollView {
          VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: URL(string: posterUrl)) { image in
              image
                .resizable()
                .aspectRatio(2.0 / 3.0, contentMode: .fill)
            } placeholder: {
              Rectangle()
                .fill(Color.secondary.opacity(0.3))
                .aspectRatio(2.0 / 3.0, contentMode: .fit)
            }
            .frame(maxWidth: .infinity)

            Text(title)
              .font(.title2)
              .bold()

            Text("Rating: \(String(format: "%.1f", rating))")
              .font(.body)
          }
          .padding(16)
        }
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Button("Close") { dismiss() }
          }
        }
      }
    }
  }
}
