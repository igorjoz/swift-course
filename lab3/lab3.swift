import Foundation

let jsonString = """
[
    {
        "profile": {
            "name": "Kwidzyński Klub Kolarski - Dziki Team Kwidzyn",
            "id": "12345"
        },
        "date": "2024-03-27T00:00:00Z",
        "mediaType": "photo",
        "numberOfLikes": 1500,
        "eventLocation": "Szemud, Poland",
        "photoDescription": "Team victory celebration",
        "videoTitle": null,
        "duration": null
    },
    {
        "profile": {
            "name": "Kwidzyński Klub Kolarski - Dziki Team Kwidzyn",
            "id": "67890"
        },
        "date": "2024-03-27T00:00:00Z",
        "mediaType": "video",
        "numberOfLikes": 5000,
        "eventLocation": null,
        "photoDescription": null,
        "videoTitle": "Cycling race highlights",
        "duration": 120
    }
]
"""

enum MediaType {
    case photo, video, text
}

struct UserProfile {
    var name: String
    var id: String
}

class FeedItem {
    var profile: UserProfile
    var date: Date
    var mediaType: MediaType
    var numberOfLikes: Int

    init(profile: UserProfile, date: Date, mediaType: MediaType, numberOfLikes: Int) {
        self.profile = profile
        self.date = date
        self.mediaType = mediaType
        self.numberOfLikes = numberOfLikes
    }

    func likesFormatted() -> String {
        if numberOfLikes >= 1000 {
            return "\(numberOfLikes / 1000)k"
        } else {
            return "\(numberOfLikes)"
        }
    }

    func dateFormatted() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}

class CyclingEventFeedItem: FeedItem {
    var eventLocation: String

    init(profile: UserProfile, date: Date, mediaType: MediaType, numberOfLikes: Int, eventLocation: String) {
        self.eventLocation = eventLocation
        super.init(profile: profile, date: date, mediaType: mediaType, numberOfLikes: numberOfLikes)
    }

    func eventInfo() -> String {
        return "Location: \(eventLocation) | Date: \(dateFormatted()) | Likes: \(likesFormatted())"
    }
}

class PhotoFeedItem: FeedItem {
    var photoDescription: String

    init(profile: UserProfile, date: Date, numberOfLikes: Int, photoDescription: String) {
        self.photoDescription = photoDescription
        super.init(profile: profile, date: date, mediaType: .photo, numberOfLikes: numberOfLikes)
    }

    func photoInfo() -> String {
        return "Photo: \(photoDescription) | Date: \(dateFormatted()) | Likes: \(likesFormatted())"
    }
}

class VideoFeedItem: FeedItem {
    var videoTitle: String
    var duration: TimeInterval

    init(profile: UserProfile, date: Date, numberOfLikes: Int, videoTitle: String, duration: TimeInterval) {
        self.videoTitle = videoTitle
        self.duration = duration
        super.init(profile: profile, date: date, mediaType: .video, numberOfLikes: numberOfLikes)
    }

    func durationFormatted() -> String {
        let hours = Int(duration) / 3600
        let minutes = Int(duration) % 3600 / 60
        let seconds = Int(duration) % 60
        return "\(hours)h \(minutes)m \(seconds)s"
    }

    func videoInfo() -> String {
        return "Video: \(videoTitle) | Duration: \(durationFormatted()) | Date: \(dateFormatted()) | Likes: \(likesFormatted())"
    }
}

func createDate(day: Int, month: Int, year: Int) -> Date {
    var dateComponents = DateComponents()
    dateComponents.day = day
    dateComponents.month = month
    dateComponents.year = year
    let calendar = Calendar.current
    return calendar.date(from: dateComponents) ?? Date()
}

let specificDate = createDate(day: 27, month: 3, year: 2024)

let pageProfile = UserProfile(name: "Kwidzyński Klub Kolarski - Dziki Team Kwidzyn", id: "12345")
let personProfile = UserProfile(name: "Jacek Hillar", id: "678")

let cyclingEvent = CyclingEventFeedItem(profile: pageProfile, date: specificDate, mediaType: .photo, numberOfLikes: 1500, eventLocation: "Szemud, Poland")
let photoPost = PhotoFeedItem(profile: pageProfile, date: specificDate, numberOfLikes: 340, photoDescription: "Team victory celebration")
let videoPost = VideoFeedItem(profile: pageProfile, date: specificDate, numberOfLikes: 5000, videoTitle: "Cycling race highlights", duration: 120)

print(cyclingEvent.eventInfo())
print(photoPost.photoInfo())
print(videoPost.videoInfo())



// ---
// struct Profile: Codable {
//     var name: String
//     var id: String
// }

// struct FeedItemData: Codable {
//     var profile: Profile
//     var date: Date
//     var mediaType: MediaType
//     var numberOfLikes: Int
//     var eventLocation: String?
//     var photoDescription: String?
//     var videoTitle: String?
//     var duration: TimeInterval?
// }

// enum MediaType: String, Codable {
//     case photo, video, text
// }

// func iso8601Formatter() -> DateFormatter {
//     let formatter = DateFormatter()
//     formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//     return formatter
// }

// let decoder = JSONDecoder()
// decoder.dateDecodingStrategy = .formatted(iso8601Formatter())

// if let jsonData = jsonString.data(using: .utf8) {
//     do {
//         let feedItemsData = try decoder.decode([FeedItemData].self, from: jsonData)
//         for feedItemData in feedItemsData {
//             print(feedItemData)
//         }
//     } catch {
//         print("Error decoding JSON: \(error)")
//     }
// }
