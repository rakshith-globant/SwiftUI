
import SwiftUI

struct ContentView: View {
    
    @State  var userName: String = ""
    @State  var userPassword: String = ""
    
    @State private var isFirstTimeUser = false
    
    @State private var isAlertShown = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                Color.red
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack(alignment: .center, spacing: 180.0) {
                    Text("SwiftUI")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    VStack(alignment: .center, spacing: 25) {
                        TextField("Username", text: $userName)
                            .padding(.all)
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        TextField("Password", text: $userPassword)
                            .padding(.all)
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        Toggle(isOn: $isFirstTimeUser) {
                            Text("First Time User")
                                .font(.headline)
                                .bold()
                                .padding(.horizontal, -10)
                                .foregroundColor(Color.white)
                        }.padding(.horizontal, 17)
                        
                        Button(action: {
                            if self.userName.count <= 5 {
                                self.isAlertShown = true
                            } else {
                                
                            }
                        })
                        {
                            NavigationLink(destination: Text("Hello")) {
                                Text(isFirstTimeUser ? "SignUp" : "Login")
                                .fontWeight(.medium)
                                .font(.title)
                                .foregroundColor(Color.red)
                                .padding(.horizontal, 10)
                            }
                        }.padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .alert(isPresented: $isAlertShown) {
                                () -> Alert in
                                Alert(title: Text("UserName Invalid"), message: Text("Username has to be more than 5 characters"), dismissButton:.default(Text("Got that!")))
                        }
                    }.padding(.horizontal, 17)
                    
                }.background(Color.black)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
