import Foundation


// Data model

struct Location {
    let id: UUID
    let type: String
    let name: String
    let rating: Int
}

struct City {
    let id: UUID
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
    let keywords: [String]
    var locations: [Location]
}

var cities = [
    City(
		id: UUID(), 
		name: "Warsaw", 
		description: "Capital", 
		latitude: 52.2297, 
		longitude: 21.0122, 
		keywords: ["capital", "history", "culture"], 
		locations: [
			Location(id: UUID(), type: "restaurant", name: "Warsaw Restaurant", rating: 5),
			Location(id: UUID(), type: "pub", name: "Warsaw Pub", rating: 4)
		]
	),
    City(id: UUID(), name: "Krakow", description: "Historic", latitude: 50.0647, longitude: 19.9450, keywords: ["history", "culture", "tourism"], locations: [Location(id: UUID(), type: "pub", name: "Cracow Pub", rating: 4)]),
    City(id: UUID(), name: "Gdansk", description: "Port", latitude: 54.3520, longitude: 18.6466, keywords: ["seaside", "history", "shipbuilding"], locations: [Location(id: UUID(), type: "restaurant", name: "Gdansk Restaurant", rating: 5)]),
    City(id: UUID(), name: "Poznan", description: "Old", latitude: 52.4064, longitude: 16.9252, keywords: ["history", "education", "business"], locations: []),
    City(id: UUID(), name: "Wroclaw", description: "Cultural", latitude: 51.1079, longitude: 17.0385, keywords: ["culture", "education", "business"], locations: []),
    City(id: UUID(), name: "Szczecin", description: "Green", latitude: 53.4285, longitude: 14.5528, keywords: ["port", "history", "green spaces"], locations: []),
    City(id: UUID(), name: "Lodz", description: "Industrial", latitude: 51.7592, longitude: 19.4560, keywords: ["culture", "film", "industry"], locations: []),
    City(id: UUID(), name: "Katowice", description: "Industrial", latitude: 50.2709, longitude: 19.0390, keywords: ["industry", "music", "business"], locations: []),
    City(id: UUID(), name: "Lublin", description: "Educational", latitude: 51.2465, longitude: 22.5684, keywords: ["history", "education", "culture"], locations: []),
    City(id: UUID(), name: "Bialystok", description: "Green", latitude: 53.1325, longitude: 23.1688, keywords: ["green spaces", "culture", "education"], locations: []),
    City(id: UUID(), name: "Gdynia", description: "Modern", latitude: 54.5189, longitude: 18.5305, keywords: ["seaside", "modern", "shipping"], locations: []),
    City(id: UUID(), name: "Czestochowa", description: "Religious", latitude: 50.8118, longitude: 19.1203, keywords: ["religious", "pilgrimage", "history"], locations: []),
    City(id: UUID(), name: "Sopot", description: "Touristic", latitude: 54.4416, longitude: 18.5601, keywords: ["seaside", "tourism", "spa"], locations: []),
    City(id: UUID(), name: "Kielce", description: "Historic", latitude: 50.8661, longitude: 20.6286, keywords: ["history", "green spaces", "education"], locations: []),
    City(id: UUID(), name: "Olsztyn", description: "Lakeside", latitude: 53.7784, longitude: 20.4801, keywords: ["lakes", "green spaces", "history"], locations: []),
    City(id: UUID(), name: "Opole", description: "Musical", latitude: 50.6751, longitude: 17.9213, keywords: ["music", "festival", "culture"], locations: []),
    City(id: UUID(), name: "Rzeszow", description: "Dynamic", latitude: 50.0412, longitude: 21.9991, keywords: ["business", "education", "culture"], locations: []),
    City(id: UUID(), name: "Torun", description: "Medieval", latitude: 53.0137, longitude: 18.5981, keywords: ["history", "food", "education"], locations: []),
    City(id: UUID(), name: "Bydgoszcz", description: "Artistic", latitude: 53.1235, longitude: 18.0076, keywords: ["culture", "music", "art"], locations: []),
    City(id: UUID(), name: "Zielona Gora", description: "Vinous", latitude: 51.9356, longitude: 15.5062, keywords: ["wine", "culture", "festival"], locations: [])
]


// Search

func searchCityByName(name: String) -> [City] {
    return cities.filter { $0.name.lowercased().contains(name.lowercased()) }
}

func searchCityByKeyword(keyword: String) -> [City] {
    return cities.filter { $0.keywords.contains(keyword) }
}


// Distance

func degreesToRadians(degrees: Double) -> Double {
    return degrees * Double.pi / 180
}

func calculateDistance(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
    let earthRadiusKm = 6371.0
    let dLat = degreesToRadians(degrees: lat2 - lat1)
    let dLon = degreesToRadians(degrees: lon2 - lon1)

    let deltaLatKm = dLat * earthRadiusKm
    let deltaLonKm = dLon * earthRadiusKm * cos(degreesToRadians(degrees: (lat1 + lat2) / 2))

    return sqrt(deltaLatKm * deltaLatKm + deltaLonKm * deltaLonKm)
}

func closestAndFarthestCity(userLat: Double, userLon: Double) -> (closest: City, farthest: City) {
    var minDistance = Double.greatestFiniteMagnitude
    var maxDistance = Double.leastNormalMagnitude
    var closestCity = cities[0]
    var farthestCity = cities[0]

    for city in cities {
        let distance = calculateDistance(lat1: userLat, lon1: userLon, lat2: city.latitude, lon2: city.longitude)
        if distance < minDistance {
            minDistance = distance
            closestCity = city
        }
        if distance > maxDistance {
            maxDistance = distance
            farthestCity = city
        }
    }

    return (closestCity, farthestCity)
}

func twoFarthestCities() -> (City, City) {
    var maxDistance = Double.leastNormalMagnitude
    var cityPair: (City, City) = (cities[0], cities[1])

    for i in 0..<cities.count {
        for j in i+1..<cities.count {
            let distance = calculateDistance(lat1: cities[i].latitude, lon1: cities[i].longitude, lat2: cities[j].latitude, lon2: cities[j].longitude)
            if distance > maxDistance {
                maxDistance = distance
                cityPair = (cities[i], cities[j])
            }
        }
    }

    return cityPair
}

func citiesWithFiveStarRestaurants() -> [City] {
    return cities.filter { city in
        city.locations.contains { location in
            location.type == "restaurant" && location.rating == 5
        }
    }
}

func relatedLocationsInCity(city: City) -> [Location] {
    return city.locations.sorted { $0.rating > $1.rating }
}

func citiesWithFiveStarLocationCount() -> [(city: City, count: Int, locations: [Location])] {
    return cities.map { city in
        let fiveStarLocations = city.locations.filter { $0.rating == 5 }
        return (city, fiveStarLocations.count, fiveStarLocations)
    }
}

let distance = calculateDistance(lat1: 52.2297, lon1: 21.0122, lat2: 50.0647, lon2: 19.9450)
print("Approximate distance between Warsaw and Krakow: \(distance) km")


let fiveStarCities = citiesWithFiveStarRestaurants()
print("Cities with 5-star restaurants:")
for city in fiveStarCities {
    print(city.name)
}
