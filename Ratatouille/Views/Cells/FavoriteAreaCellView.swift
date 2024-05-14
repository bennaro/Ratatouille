import SwiftUI

struct FavoriteAreaCellView: View {
    let meal: Meal
    
    private let flagImageURLs: [String: String] = [
        "American": "https://flagsapi.com/US/shiny/64.png",
        "British": "https://flagsapi.com/GB/shiny/64.png",
        "Canadian": "https://flagsapi.com/CA/shiny/64.png",
        "Chinese": "https://flagsapi.com/CN/shiny/64.png",
        "Croatian": "https://flagsapi.com/HR/shiny/64.png",
        "Dutch": "https://flagsapi.com/NL/shiny/64.png",
        "Egyptian": "https://flagsapi.com/EG/shiny/64.png",
        "Filipino": "https://flagsapi.com/PH/shiny/64.png",
        "French": "https://flagsapi.com/FR/shiny/64.png",
        "Greek": "https://flagsapi.com/GR/shiny/64.png",
        "Indian": "https://flagsapi.com/IN/shiny/64.png",
        "Irish": "https://flagsapi.com/IE/shiny/64.png",
        "Italian": "https://flagsapi.com/IT/shiny/64.png",
        "Jamaican": "https://flagsapi.com/JM/shiny/64.png",
        "Japanese": "https://flagsapi.com/JP/shiny/64.png",
        "Kenyan": "https://flagsapi.com/KE/shiny/64.png",
        "Malaysian": "https://flagsapi.com/MY/shiny/64.png",
        "Mexican": "https://flagsapi.com/MX/shiny/64.png",
        "Moroccan": "https://flagsapi.com/MA/shiny/64.png",
        "Polish": "https://flagsapi.com/PL/shiny/64.png",
        "Portuguese": "https://flagsapi.com/PT/shiny/64.png",
        "Russian": "https://flagsapi.com/RU/shiny/64.png",
        "Spanish": "https://flagsapi.com/ES/shiny/64.png",
        "Thai": "https://flagsapi.com/TH/shiny/64.png",
        "Tunisian": "https://flagsapi.com/TN/shiny/64.png",
        "Turkish": "https://flagsapi.com/TR/shiny/64.png",
        "Unknown": "https://flagsapi.com/XK/shiny/64.png",
        "Vietnamese": "https://flagsapi.com/VN/shiny/64.png",
        
    ]
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: flagImageURLs[meal.strArea ] ?? "")) { image in
                image
                    .resizable()
                    .frame(width: 20, height: 20)
                    .cornerRadius(5)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .cornerRadius(5)
                    .foregroundColor(.gray)
            }
            Text(meal.strArea)
        }
        
    }
}
#Preview {
    EmptyView()
}
