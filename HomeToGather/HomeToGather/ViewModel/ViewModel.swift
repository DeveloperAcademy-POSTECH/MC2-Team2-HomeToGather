import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseStorage

class ViewModel: ObservableObject {
    private var db = Firestore.firestore()
    private var storage = Storage.storage()
    @Published var invitations = [Invitation(uid: "", organizerName: "", participantName: [""], participantUid: [""], title: "", date: "", place: "", description: "", rule: [""], cost: "", food: [""], etc: [""], image: "", ruleFeedback: [""], foodFeedback: [""], color: "")]
    @Published var invitationsReceived = [Invitation(uid: "", organizerName: "", participantName: [""], participantUid: [""], title: "", date: "", place: "", description: "", rule: [""], cost: "", food: [""], etc: [""], image: "", ruleFeedback: [""], foodFeedback: [""], color: "")]
    @Published var invitationsSent = [Invitation(uid: "", organizerName: "", participantName: [""], participantUid: [""], title: "", date: "", place: "", description: "", rule: [""], cost: "", food: [""], etc: [""], image: "", ruleFeedback: [""], foodFeedback: [""], color: "")]
    @Published var images: [String:UIImage] = ["test":UIImage(systemName: "pencil")!]

    func uploadInvitation(_ invitation: Invitation, _ image: UIImage) {
        
        let uid = Auth.auth().currentUser!.uid
        let id = UUID().uuidString
        let imageName = UUID().uuidString
        
        uploadImage(image, (id + "/" + imageName))
        
        let invitation = Invitation(id: id, uid: uid, organizerName: invitation.organizerName, participantName: invitation.participantName, participantUid: invitation.participantUid, title: invitation.title, date: invitation.date, place: invitation.place, description: invitation.description, rule: invitation.rule, cost: invitation.cost, food: invitation.food, etc: invitation.etc, image: imageName, ruleFeedback: [""], foodFeedback: [""], color: invitation.color)
        
        let _ = db.collection("ii").document(id).setData(invitation.dictionary)

    }

    func uploadImage(_ image: UIImage, _ name: String) {
        let storageRef = storage.reference().child("images/\(name)")
            let data = image.jpegData(compressionQuality: 0.1)
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"
            
            // uploda data
            if let data = data {
                storageRef.putData(data, metadata: metadata) { (metadata, err) in
                    if let err = err {
                        print("err when uploading jpg\n\(err)")
                    }
                    
                    if let metadata = metadata {
                        print("metadata: \(metadata)")
                    }
                }
            }
    }

    func fetchInvitation() {
        db.collection("ii").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
            }
            
            self.invitations = documents.map({ (queryDocumentSnapshot) -> Invitation in
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
            })
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
    
    func fetchInvitationsReceived(_ invitationUid: String) {
        db.collection("ii").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
            }
            var received = [Invitation(uid: "", organizerName: "", participantName: [""], participantUid: [""], title: "", date: "", place: "", description: "", rule: [""], cost: "", food: [""], etc: [""], image: "", ruleFeedback: [""], foodFeedback: [""], color: "")]
            received = documents.map({ (queryDocumentSnapshot) -> Invitation in
                if queryDocumentSnapshot.data()["uid"] as? String ?? "" != Auth.auth().currentUser!.uid {
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
            
            self.invitationsReceived = received.filter { $0.id != "" }
        }
    }
    
    func fetchInvitationsSent(_ invitationUid: String) {
        db.collection("ii").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
            }
            var sent = [Invitation(uid: "", organizerName: "", participantName: [""], participantUid: [""], title: "", date: "", place: "", description: "", rule: [""], cost: "", food: [""], etc: [""], image: "", ruleFeedback: [""], foodFeedback: [""], color: "")]
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
            
            self.invitationsSent = sent.filter { $0.id != "" }
        }
    }
    
    func correctionInvitation(_ invitation: Invitation) {
        let _ = db.collection("ii").document(invitation.id).setData(invitation.dictionary)
    }
    
    func correctionRuleFeedback(_ invitation: Invitation,_ ruleFeedback: String) {
        var feedback: [String] = invitation.ruleFeedback
        feedback.append(ruleFeedback)
        let _ = db.collection("ii").document(invitation.id).setData(["ruleFeedback":feedback])
    }
    
    func correctionFoodFeedback(_ invitation: Invitation,_ foodFeedback: String) {
        var feedback: [String] = invitation.foodFeedback
        feedback.append(foodFeedback)
        let _ = db.collection("ii").document(invitation.id).setData(["foodFeedback":feedback])
    }
    
    func deleteInvitation(_ invitation: Invitation) {
        let _ = db.collection("ii").document(invitation.id).delete()
    }

    
    // Deeplink
    // ID 값으로 Invitation 구조체 생성해 전달
    func findInvitation(id: String, _ completion: @escaping (_ data: Invitation?) -> Void ) {
        
        let docRef = Firestore.firestore().collection("ii").document(id)
        
        print("Find : DocsID is \(docRef.documentID)")
        
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
                                        image: document["image"] as? String ?? "empty",
                                        ruleFeedback: document["ruleFeedback"] as? [String] ?? [],
                                        foodFeedback: document["foodFeedback"] as? [String] ?? [],
                                        color: document["color"] as? String ?? "empty")
                
                g.leave()
                
            } else {
                print("Document does not exist")
                g.leave()
            }
        }
        
        g.notify(queue:.main) {
            print("NEW Card: \(newInvitation?.title)")
            completion(newInvitation)
        }
        
        return
    }
}
