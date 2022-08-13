//
//  NewsArticleView.swift
//  StockApp
//
//  Created by AnhNguyen on 12/08/2022.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let newsArticle: [NewsArticleViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    var body: some View {
        
        let screenSize = UIScreen.main.bounds.size
        return VStack(alignment: .leading) {
            HStack{
            VStack(alignment: .leading) {
                Text("Top News")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(2)
                
                Text("From News")
                    .foregroundColor(Color.gray)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(2)
            }
                
                Spacer()
            }.padding()
                .contentShape(Rectangle())
                .gesture(DragGesture()
                .onChanged(self.onDragBegin)
                .onEnded(self.onDragEnd))
            ScrollView {
                VStack {
                    ForEach(self.newsArticle, id: \.title) { article in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(article.publication)
                                    .foregroundColor(Color.white)
                                    .font(.custom("Arial", size: 22))
                                    .fontWeight(.bold)
                                Text(article.title)
                                    .foregroundColor(Color.white)
                                    .font(.custom("Arial", size: 22))
                            }.padding(10)
                            Spacer()
                            
                            URLImage(URL(string: article.imageURL)!) { image in
                                image.resizable()
                            }.frame(width: 100, height: 100)
                        }
                    }
                }.frame(maxWidth: .infinity)
                
                
            }.frame(width: screenSize.width, height: screenSize.height)
                .background(Color(red: 27/255, green: 28/255, blue: 30/255))
                .cornerRadius(20)
        }
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(title: "News Title", imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg", publication: "The WallStreet Journal")
        return NewsArticleView(newsArticle: [NewsArticleViewModel(article: article)], onDragBegin: { _ in}, onDragEnd: { _ in })
    }
}
