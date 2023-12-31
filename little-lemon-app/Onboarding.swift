import SwiftUI

let kFirstName = "firstname key"
let kLastName = "lastname key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                VStack {
                    Spacer().frame(height: 20)
                    
                    Text("Register")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 20)
                    
                    TextField("First Name", text: $firstName)
                        .padding(20)
                        .frame(width: 300.0)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.black), lineWidth: 1)
                        )
                    TextField("Last Name", text: $lastName)
                        .padding(20)
                        .frame(width: 300.0)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.black), lineWidth: 1)
                        )
                    TextField("Email", text: $email)
                        .padding(20)
                        .frame(width: 300.0)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.black), lineWidth: 1)
                        )
                    Spacer().frame(height: 30)
                    Button("Register") {
                        if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            isLoggedIn = true
                        }
                    }
                    .frame(width: 300, height: 60)
                    .foregroundColor(Color(.white))
                    .background(Color("greenColor"))
                    .clipShape(Capsule())
                    Spacer()
                        .onAppear() {
                            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                                isLoggedIn = true
                            }
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(Color.white) // Set the background to white
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
