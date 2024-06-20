import UIKit
import Foundation

actor User {
    private var score: Int = 0
    
    func printScore() {
        print(score)
    }
    
    func setScore(_ other: User) async {
        self.score = await other.score
    }
}

let user1 = User()
let user2 = User()

await user1.printScore()
await user2.setScore(user1)
