import SwiftUI

struct ErrorView: View {
    let message: String
    var body: some View {
        Text(message)
            .font(.largeTitle)
            .foregroundColor(Color.red)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "There was an error")
    }
}
