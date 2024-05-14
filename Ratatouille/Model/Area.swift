import Foundation
import SwiftData

@Model
class Area {
    var areaName: String
    var areaDate: Date
    
    init(areaName: String, areaDate: Date) {
        self.areaName = areaName
        self.areaDate = areaDate
    }
}
