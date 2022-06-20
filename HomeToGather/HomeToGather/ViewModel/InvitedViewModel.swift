//
//  InvitedViewModel.swift
//  HomeToGather
//
//  Created by 정지혁 on 2022/06/14.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class InvitedViewModel: ObservableObject {
    private var db = Firestore.firestore()
    private var storage = Storage.storage()
    
    @Published var invitationsSent = [Invitation(id: "", uid: "", organizerName: "", participantName: [""], participantUid: [""], title: "", date: "", place: "", description: "", rule: [""], cost: "", food: [""], etc: [""], ruleFeedback: [""], foodFeedback: [""], color: "")]
    @Published var userName = ""
    
    func fetchInvitationsSent(_ invitationUid: String) {
        db.collection("ii").order(by: "date", descending: true).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
            }
            var sent = [Invitation(id: "", uid: "", organizerName: "", participantName: [""], participantUid: [""], title: "", date: "", place: "", description: "", rule: [""], cost: "", food: [""], etc: [""], ruleFeedback: [""], foodFeedback: [""], color: "")]
            sent = documents.map({ (queryDocumentSnapshot) -> Invitation in
                if (queryDocumentSnapshot.data()["participantUid"] as? [String] ?? [""]).contains(invitationUid) {
                    let data = queryDocumentSnapshot.data()
                    let id = data["id"] as? String ?? "blank id"
                    let uid = data["uid"] as? String ?? "blank uid"
                    let organizerName = data["organizerName"] as? String ?? "blank organizerName"
                    let participantName = data["participantName"] as? [String] ?? ["blank participantName"]
                    let participantUid = data["participantUid"] as? [String] ?? ["blank participantUid"]
                    let title = data["title"] as? String ?? "blank title"
                    let date = data["date"] as? String ?? "blank date"
                    let place = data["place"] as? String ?? "blank place"
                    let description = data["description"] as? String ?? "blank description"
                    let rule = data["rule"] as? [String] ?? ["blank rule"]
                    let cost = data["cost"] as? String ?? "blank cost"
                    let food = data["food"] as? [String] ?? ["blank food"]
                    let etc = data["etc"] as? [String] ?? ["blank etc"]
                    let ruleFeedback = data["ruleFeedback"] as? [String] ?? [""]
                    let foodFeedback = data["foodFeedback"] as? [String] ?? [""]
                    let color = data["color"] as? String ?? "blank color"
                    return Invitation(id: id, uid: uid, organizerName: organizerName, participantName: participantName, participantUid: participantUid, title: title, date: date, place: place, description: description, rule: rule, cost: cost, food: food, etc: etc, ruleFeedback: ruleFeedback, foodFeedback: foodFeedback, color: color)
                } else {
                    return Invitation(id: "", uid: "", organizerName: "", title: "", date: "", place: "", description: "", rule: [""], cost: "", food: [""], etc: [""], ruleFeedback: [""], foodFeedback: [""], color: "")
                }
            })
            
            self.invitationsSent = sent.filter { $0.id != "" }
        }
    }
    
    func acceptInvitation(_ uid: String, _ name: String, _ invitation: Invitation) {
        var acceptInvitation = invitation
        
        if invitation.uid != uid {
            print("DEBUG: Checking Organizer")
            if let participantNames = invitation.participantName, let participantUids = invitation.participantUid {
                if !participantNames.contains(name) && !participantUids.contains(uid) {
                    print("DEBUG: Checking Participant")
                    acceptInvitation.participantUid?.append(getUserUid())
                    acceptInvitation.participantName?.append(name)
                    let _ = db.collection("ii").document(acceptInvitation.id).setData(acceptInvitation.dictionary)
                }
            }
        }
    }
    
    func getUserName(_ uid: String, completion: @escaping (_ data: String) -> Void) {
        
        let g = DispatchGroup()
        g.enter()
        
        let ref = db.collection("user").document(uid)
        
        ref.getDocument { document, error in
            
            if let error = error as NSError? {
                print(error)
                g.leave()
            }
            else {
                if let document = document {
                    let data = document.data()
                    let name = data?["name"]
                    self.userName = name as! String
                }
                g.leave()
            }
        }
        
        g.notify(queue: .main) {
            completion(self.userName)
        }
    }
    
    func findInvitation(id: String, _ completion: @escaping (_ data: Invitation?) -> Void ) {
        let docRef = Firestore.firestore().collection("ii").document(id)
                
        var newInvitation: Invitation?

        let g = DispatchGroup()
        g.enter()
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
    
                newInvitation = Invitation(id: document["id"] as? String ?? "empty",
                                        uid: document["uid"] as? String ?? "empty",
                                        organizerName: document["organizerName"] as? String ?? "empty",
                                        participantName: document["participantName"] as? [String] ?? [],
                                        participantUid: document["participantUid"] as? [String] ?? [],
                                        title: document["title"] as? String ?? "empty",
                                        date: document["date"] as? String ?? "empty",
                                        place: document["place"] as? String ?? "empty",
                                        description: document["description"] as? String ?? "empty",
                                        rule: document["rule"] as? [String] ?? [],
                                        cost: document["cost"] as? String ?? "empty",
                                        food: document["food"] as? [String] ?? [],
                                        etc: document["etc"] as? [String] ?? [],
                                        ruleFeedback: document["ruleFeedback"] as? [String] ?? [],
                                        foodFeedback: document["foodFeedback"] as? [String] ?? [],
                                        color: document["color"] as? String ?? "empty")
                
                g.leave()
                
            } else {
                print("Document does not exist")
                completion(nil)
                g.leave()
            }
        }
        
        g.notify(queue:.main) {
            completion(newInvitation)
        }
        
        return
    }
}
