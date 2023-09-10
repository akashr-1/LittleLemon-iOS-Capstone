import SwiftUI

struct HomeHeader: View {
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .background(Color.white)
            
            Text("Little Lemon")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("yellowColor"))
                .multilineTextAlignment(.leading)
                .padding(.top, 10)
            
            Text("Chicago")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color("yellowColor"))
                .multilineTextAlignment(.leading)
                .padding(.leading, 10)
            
            Text("We are a family-owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                .font(.body)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(22)
        }
        .background(Color("greenColor"))
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader()
    }
}
