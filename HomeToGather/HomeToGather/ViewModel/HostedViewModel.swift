//
//  HostedViewModel.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/14.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseStorage

class HostedViewModel: ObservableObject {
    private var db = Firestore.firestore()
    private var storage = Storage.storage()
    
    @Published var invitationsReceived = [Invitation(uid: "", organizerName: "", participantName: [""], participantUid: [""], title: "", date: "", place: "", description: "", rule: [""], cost: "", food: [""], etc: [""], image: "", ruleFeedback: [""], foodFeedback: [""], color: "")]
    @Published var images: [String:UIImage] = ["test":UIImage(systemName: "pencil")!]
    
    func fetchInvitationsReceived(_ invitationUid: String) {
        db.collection("ii").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
            }
            var received = [Invitation(uid: "", organizerName: "", participantName: [""], participantUid: [""], title: "", date: "", place: "", description: "", rule: [""], cost: "", food: [""], etc: [""], image: "", ruleFeedback: [""], foodFeedback: [""], color: "")]
            received = documents.map({ (queryDocumentSnapshot) -> Invitation in
                if queryDocumentSnapshot.data()["uid"] as? String ?? "" == invitationUid {
                    let data = queryDocumentSnapshot.data()
                    let id = data["id"] as? String ?? "blank id"
                    let uid = data["uid"] as? String ?? "blank uid"
                    let organizerName = data["organizerName"] as? String ?? "blank organizerName"
                    let participantName = data["participantName"] as? [String] ?? ["blank participantName"]
                    let participantUid = data["paricipantUid"] as? [String] ?? ["blank paricipantUid"]
                    let title = data["title"] as? String ?? "blank title"
                    let date = data["date"] as? String ?? "blank date"
                    let place = data["place"] as? String ?? "blank place"
                    let description = data["description"] as? String ?? "blank description"
                    let rule = data["rule"] as? [String] ?? ["blank rule"]
                    let cost = data["cost"] as? String ?? "blank cost"
                    let food = data["food"] as? [String] ?? ["blank food"]
                    let etc = data["etc"] as? [String] ?? ["blank etc"]
                    let image = data["image"] as? String ?? "blank image"
                    let ruleFeedback = data["ruleFeedback"] as? [String] ?? [""]
                    let foodFeedback = data["foodFeedback"] as? [String] ?? [""]
                    let color = data["color"] as? String ?? "blank color"
                    self.fetchImage(id, image)
                    return Invitation(id: id, uid: uid, organizerName: organizerName, participantName: participantName, participantUid: participantUid, title: title, date: date, place: place, description: description, rule: rule, cost: cost, food: food, etc: etc, image: image, ruleFeedback: ruleFeedback, foodFeedback: foodFeedback, color: color)
                } else {
                    return Invitation(id: "", uid: "", organizerName: "", title: "", date: "", place: "", description: "", rule: [""], cost: "", food: [""], etc: [""], image: "", ruleFeedback: [""], foodFeedback: [""], color: "")
                }
            })
            
            self.invitationsReceived = received.filter { $0.uid != "" }
        }
    }
    
    func fetchImage(_ invitationId: String, _ imageName: String) {
        let ref = storage.reference().child("images/\(invitationId)/\(imageName)")
        
        ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("error while downloading image\n\(error.localizedDescription)")
                return
            } else {
                let image = UIImage(data: data!)
                self.images[imageName] = image
            }
        }
    }
}
