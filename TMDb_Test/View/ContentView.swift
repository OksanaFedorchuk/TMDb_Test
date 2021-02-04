//
//  ContentView.swift
//  TMDb_Test
//
//  Created by Oksana Fedorchuk on 02.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                LoginText()
                LoginImage()
                UsernameTextfield(username: $username)
                PasswordTextfield(password: $password)
                if authenticationDidFail {
                    Text("Unvalid username or password")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                NavigationLink(
                    destination: FavouritesView(),
                    label: {
                            LoginButtonContent()
                    })
            }
            .padding()
            .offset(y: -60)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct LoginText: View {
    var body: some View {
        Text("TheMovieDB")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom)
    }
}

struct LoginImage: View {
    var body: some View {
        Image("Movies-Director")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 220, height: 60)
            .background(Color.black)
            .cornerRadius(35.0)
    }
}

struct UsernameTextfield: View {
    
    @Binding var username: String
    
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(Color.oceanColor)
            .cornerRadius(5.0)
            .padding(.bottom)
    }
}

struct PasswordTextfield: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color.oceanColor)
            .cornerRadius(5.0)
            .padding(.bottom)
    }
}

extension Color {
    static let oceanColor = Color("oceanColor")
}
