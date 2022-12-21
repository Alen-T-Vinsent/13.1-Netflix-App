import SwiftUI

struct SignInPage: View {
    
    @State var name: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    @State var showTabBarView:Bool = false
    @State var showAlert:Bool = false
    @AppStorage("username") private var username = "Alen"
    @AppStorage("userkey") private var userKey = "14307"
    @AppStorage("loggedIn") private var loggedIn:Bool = true
    
    
    var isSignInButtonDisabled: Bool {
        [name, password].contains(where: \.isEmpty)
    }
    
    var body: some View {
        NavigationView{
            List{
                VStack(alignment: .leading, spacing: 15) {
                    Spacer()
                    
                    TextField("Name",
                              text: $name ,
                              prompt: Text("Login").foregroundColor(.gray)
                    )
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 2)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Group {
                            if showPassword {
                                TextField("Password",
                                          text: $password,
                                          prompt: Text("Password").foregroundColor(.gray))
                            } else {
                                SecureField("Password",
                                            text: $password,
                                            prompt: Text("Password").foregroundColor(.gray))
                            }
                        }
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 2)
                        }
                        
                        HStack{
                            Button {
                                showPassword.toggle()
                            } label: {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                        }
                        .foregroundColor(Color.red)
                        
                        
                        
                    }.padding(.horizontal)
                    
                    Spacer()
                    
                }
                
                HStack{
                    Button {
                        print("doing login action...")
                        
                        if name == username && password == userKey{
                            loggedIn = true
                            showTabBarView = true
                        }else{
                            showAlert = true
                            name = ""
                            password = ""
                        }
                        
                    } label: {
                        Text("login")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(
                        isSignInButtonDisabled ?
                        Color.gray : Color.black
                    )
                    .cornerRadius(20)
                    .disabled(isSignInButtonDisabled)
                    .padding()
                    
                }
                .toolbar{
                    ToolbarItem(placement:.principal){
                        HStack{
                            Image("Netflix-logo-red-black-png-removebg-preview")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .padding(50)
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                Text("Create new account")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        print("create new account clicked")
                    }
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Account doesnot exist"),
                  message: Text("please check username and password"),
                  dismissButton:.default(Text("Got it!"))
            )
            
        })
        .fullScreenCover(isPresented: $showTabBarView, content: {
            // SignInPage()
            TabBarView()
        })
        
        
        
    }
}

