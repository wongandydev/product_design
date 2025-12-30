import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()

    var body: some View {
        // Implement SwiftUI layout here
        Text("Movie List View")
    }
}

#Preview {
    MovieListView()
}
