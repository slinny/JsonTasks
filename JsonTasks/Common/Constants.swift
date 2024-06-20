import Foundation

enum Constants: String {
    case userUrl = "https://jsonplaceholder.typicode.com/users"
    case peoplerUrl = "https://swapi.py4e.com/api/people/1"
    case movieUrl = "https://gist.githubusercontent.com/dbackeus/484315/raw/dfeb530f9619bb74af5d537280a0b3b305410d01/videos.json"
    case articleUrl = "https://gist.githubusercontent.com/congsun/600f3ad57298f9dbc23fedf6b2b25450/raw/73d7a8ed589652339ae3646d0a595298ce5e72c2/newsFeed.json"
    case mealUrl = "https://www.themealdb.com/api/json/v1/1/search.php?f=s"
}

enum APIError: String {
    case invalidURLError = "Invalid URL"
    case fetchDataError = "Error fetching data"
    case decodingError = "Error decoding data"
    case noDataError = "No data received"
}
