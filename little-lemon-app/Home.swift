import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    
    var body: some View {
        TabView {
            NavigationView {
                Menu()
            }
            .tabItem {
                Label("Menu", systemImage: "list.dash")
            }
            .environment(\.managedObjectContext, persistence.container.viewContext)
            
            NavigationView {
                UserProfile()
            }
            .tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
