//
//  ViewModel.swift
//  19. web services
//
//  Created by Despo on 30.10.24.
//

final class ViewModel {
    var newsArray = [
        SinglePost(
            background: "bgImg",
            title: "First News",
            author: "Tornike",
            description: "An overview of the latest news events and updates from around the world.",
            date: "October 30, 2024"
        ),
        SinglePost(
            background: "bgImg",
            title: "Global Market Insights",
            author: "Ana",
            description: "An analysis of the recent trends in the global market, highlighting emerging industries.",
            date: "September 15, 2024"
        ),
        SinglePost(
            background: "bgImg",
            title: "Tech Innovations 2024",
            author: "Lasha",
            description: "Exploring the latest innovations in technology and what to expect in the coming year.",
            date: "August 5, 2024"
        ),
        SinglePost(
            background: "bgImg",
            title: "AI Breakthrough in Medicine",
            author: "Mariam",
            description: "Discover the recent AI advancements that are revolutionizing the healthcare sector.",
            date: "July 12, 2024"
        ),
        SinglePost(
            background: "bgImg",
            title: "Climate Change Effects",
            author: "George",
            description: "An in-depth look at the ongoing impacts of climate change across the globe.",
            date: "June 23, 2024"
        ),
        SinglePost(
            background: "bgImg",
            title: "Economic Shifts in Asia",
            author: "Sophie",
            description: "A report on the changing economic landscape in Asia and its global implications.",
            date: "May 19, 2024"
        ),
        SinglePost(
            background: "bgImg",
            title: "Renewable Energy Trends",
            author: "Levan",
            description: "Examining the growth and future of renewable energy in the global energy market.",
            date: "April 7, 2024"
        ),
        SinglePost(
            background: "bgImg",
            title: "Advancements in Space Tech",
            author: "Nino",
            description: "Highlights of the recent breakthroughs in space technology and exploration.",
            date: "March 25, 2024"
        ),
        SinglePost(
            background: "bgImg",
            title: "Smart Cities Development",
            author: "David",
            description: "An exploration of the advancements in smart city technology and urban planning.",
            date: "February 10, 2024"
        ),
        SinglePost(
            background: "bgImg",
            title: "Future of Education",
            author: "Tina",
            description: "Insights into the evolving educational landscape and the role of technology.",
            date: "January 3, 2024"
        )
    ]

    
    var newsCount: Int {
        newsArray.count
    }
    
    func singlePost(index: Int) -> SinglePost {
        newsArray[index]
    }
}
