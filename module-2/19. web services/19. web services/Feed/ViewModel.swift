//
//  ViewModel.swift
//  19. web services
//
//  Created by Despo on 30.10.24.
//

final class ViewModel {
    var newsArray = [
        SinglePost(background: "bgImg", title: "First News", author: "Tornike", date: "October 30, 2024"),
        SinglePost(background: "bgImg", title: "Global Market Insights", author: "Ana", date: "September 15, 2024"),
        SinglePost(background: "bgImg", title: "Tech Innovations 2024", author: "Lasha", date: "August 5, 2024"),
        SinglePost(background: "bgImg", title: "AI Breakthrough in Medicine", author: "Mariam", date: "July 12, 2024"),
        SinglePost(background: "bgImg", title: "Climate Change Effects", author: "George", date: "June 23, 2024"),
        SinglePost(background: "bgImg", title: "Economic Shifts in Asia", author: "Sophie", date: "May 19, 2024"),
        SinglePost(background: "bgImg", title: "Renewable Energy Trends", author: "Levan", date: "April 7, 2024"),
        SinglePost(background: "bgImg", title: "Advancements in Space Tech", author: "Nino", date: "March 25, 2024"),
        SinglePost(background: "bgImg", title: "Smart Cities Development", author: "David", date: "February 10, 2024"),
        SinglePost(background: "bgImg", title: "Future of Education", author: "Tina", date: "January 3, 2024")
    ]
    
    var newsCount: Int {
        newsArray.count
    }
    
    func singlePost(index: Int) -> SinglePost {
        newsArray[index]
    }
}
