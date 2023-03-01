//
//  ContentView.swift
//  Count
//
//  Created by Hengchuan Zhang on 2/25/23.
//

import SwiftUI

struct LoginView: View {
    @State private var Email = ""
    @State private var password = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var forgotPassword = false
    @State private var signUp = false
    
    var body: some View {
        // NavigationView is aview for presenting a stack of views that represents a visible path in a navigation hierarchy.It will create a navigation-based app in which the user can traverse a collection of views. Users navigate to a destination view by selecting a NavigationLink that you provide.
        // Because we are not connecting our app to a database, we will not use web apis.
        NavigationView{
            // ZStack is a view that overlays its subviews, aligning them in both axes.
            ZStack{
                // set the background color of the entry interface
                Color.white
                    .ignoresSafeArea()
                // VStack arranges subviews vertically.
                VStack{
                    // used the image stored in "Assets" Part
                    Image("Clock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200, alignment: .topLeading)
                    Text("Count")
                        .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding()
                    TextField("Email", text: $Email)
                        .padding()
                        .frame(width:300,height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongEmail))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width:300,height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Sign In"){
                        authenticator(Email: Email, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width:90,height:50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    Button("Forgot Password"){
                        forgotPassword = true
                    }
                    .frame(width:200,height:30)
                    // NavigationLink is the link that could navigate the button to the destination. The destination could be another interface or just a text message.
                    NavigationLink(destination: Text("Please contact IT service at hzhang22@gwu.edu and be ready to pay a $200 account reactivation fee.")
                        .font(.title)
                        .foregroundColor(Color.red)
                        .bold()
                        .multilineTextAlignment(.center),isActive: $forgotPassword){
                        EmptyView()
                    }
                        
                    NavigationLink(destination:EventsView(events: .constant(Event.sampleData)),isActive: $showingLoginScreen){
                        EmptyView()
                }
                    .navigationBarBackButtonHidden(true)
   
                    
                    Button("Sign Up"){
                        signUp = true
                    }
                    NavigationLink(destination: Text("Welcome")
                        .font(.largeTitle)
                        .foregroundColor(Color("AccentColor")),isActive: $signUp){
                        EmptyView()
                        }
                    
                    
                    .frame(width:200,height:30)
                    }
                }
            }
            
        }
    
// just a basic verification for the password
        func authenticator(Email: String, password: String){
            if Email == "Test"{
                wrongEmail = 0
                if password.lowercased() == "test"{
                    wrongPassword = 0
                    showingLoginScreen = true
                }
                else{
                    wrongPassword = 2
                }
            }
            else{
                wrongEmail = 2
            }
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }

