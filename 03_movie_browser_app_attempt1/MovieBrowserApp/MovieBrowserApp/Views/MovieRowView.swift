import SwiftUI

// MARK: - Movie Row View
// Reusable component for displaying a movie in a list
// This view is already fully functional!

struct MovieRowView: View {

    let movie: Movie

    var body: some View {
        HStack(alignment: .top, spacing: 12) {

            // Poster Thumbnail
            if let posterPath = movie.posterPath,
               let imageURL = MovieService.shared.imageURL(for: posterPath, size: "w185") {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 60, height: 90)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 90)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    case .failure:
                        Image(systemName: "photo")
                            .font(.title)
                            .foregroundColor(.gray)
                            .frame(width: 60, height: 90)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                // Placeholder for missing poster
                Image(systemName: "film")
                    .font(.title)
                    .foregroundColor(.gray)
                    .frame(width: 60, height: 90)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            // Movie Info
            VStack(alignment: .leading, spacing: 6) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(2)

                Text(movie.releaseYear)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundColor(.yellow)
                    Text(movie.formattedRating)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    List {
        MovieRowView(movie: MockData.sampleMovie)
        MovieRowView(movie: MockData.sampleMovie)
    }
}
