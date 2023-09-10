import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Personal Information")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("yellowColor"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 25)
                    .padding(.top, 20)

                Image("Profile")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .aspectRatio(contentMode: .fill)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .padding(.vertical, 20)

                UserInfoRow(title: "First Name:", value: UserDefaults.standard.string(forKey: kFirstName) ?? "")
                UserInfoRow(title: "Last Name:", value: UserDefaults.standard.string(forKey: kLastName) ?? "")
                UserInfoRow(title: "Email:", value: UserDefaults.standard.string(forKey: kEmail) ?? "")

                Button("Logout") {
                    UserDefaults.standard.set("", forKey: kFirstName)
                    UserDefaults.standard.set("", forKey: kLastName)
                    UserDefaults.standard.set("", forKey: kEmail)
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    self.presentation.wrappedValue.dismiss()
                }
                .frame(width: 300, height: 60)
                .foregroundColor(.white)
                .background(Color("greenColor"))
                .clipShape(Capsule())
                .padding(25)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .padding(50)
            .shadow(radius: 5)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("yellowColor"))
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}

struct UserInfoRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .frame(width: 100, alignment: .leading)

            Text(value)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}
