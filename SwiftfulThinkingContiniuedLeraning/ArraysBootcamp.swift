//
//  ArraysBootcamp.swift
//  SwiftfulThinkingContiniuedLeraning
//
//  Created by Michael on 13.05.2024.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
       
        // Sort
        /*
//        filteredArray = dataArray.sorted { user1, user2 in
//            return user1.points > user2.points
//        }
        
//        two identical logics, but the bottom one is shorter and simpler
        
//        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
         */
        
        // Filter
        /*
//        filteredArray = dataArray.filter({ user in
///   type of filters:
//            return user.points < 50,
//            return user.points > 50,
//            return user.isVerified,
//            return user.name.contains("i")
//            return !user.isVerified // is not verified
//        })
        
//        two identical logics, but the bottom one is shorter and simpler
  
//        filteredArray = dataArray.filter({ $0.isVerified })
         */
        
        // Map
        /*
//        mappedArray = dataArray.map({ user in
//            return user.name ?? "Error"
//        })
        
//        mappedArray = dataArray.map({$0.name})
        
//        mappedArray = dataArray.compactMap({ user in // without error in user nicknames
//            return user.name
//        })

//        two identical logics, but the bottom one is shorter and simpler
        
//        mappedArray = dataArray.compactMap({$0.name})
        */
        
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points }) // by most to lowest points
            .filter({ $0.isVerified }) // by status is verefied
            .compactMap({ $0.name }) // by name is fill
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Nick", points: 5, isVerified: true)
        let user2 = UserModel(name: "Chris", points: 0, isVerified: false)
        let user3 = UserModel(name: nil, points: 20, isVerified: true)
        let user4 = UserModel(name: "Emily", points: 50, isVerified: false)
        let user5 = UserModel(name: "Samanta", points: 45, isVerified: true)
        let user6 = UserModel(name: "Jason", points: 23, isVerified: false)
        let user7 = UserModel(name: "Sarah", points:76, isVerified: true)
        let user8 = UserModel(name: nil, points: 45, isVerified: false)
        let user9 = UserModel(name: "Steve", points: 1, isVerified: true)
        let user10 = UserModel(name: "Amanda", points: 100, isVerified: false)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
        ])
    }
    
}

struct ArraysBootcamp: View {
    
    @State var vm = ArrayModificationViewModel() // vm - view model
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack{
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                                    .foregroundStyle(Color.orange)
//                                    .fontWeight(.semibold)
//                            } else {
//                                Image(systemName: "minus")
//                            }
//                        }
//                    }
//                    .foregroundStyle(Color.white)
//                    .padding()
//                    .background(Color.blue.clipShape(.rect(cornerRadius: 10)))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

#Preview {
    ArraysBootcamp()
}
