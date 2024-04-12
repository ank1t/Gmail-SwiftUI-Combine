import UIKit
import Combine

let arrayPublisher = [1,2,3,4,5,6,7].publisher<Int, Never>()

arrayPublisher.receive(subscriber: <#T##S#>)
