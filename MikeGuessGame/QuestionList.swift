//
//  QuestionList.swift
//  MikeGuessGame
//
//  Created by 白謹瑜 on 2021/3/8.
//

import SwiftUI

struct QuestionList: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("題庫：")
                .font(.largeTitle)
                .fontWeight(.heavy)
            ForEach(guessQuestions.indices){ index in
                HStack{
                Text(guessQuestions[index].question)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading)
                    Spacer()
                }
                                    
            }
            .background(
                Rectangle()
                    .opacity(0.5)
            )

            Spacer()
        }
        .background(
            Image("列表背景圖")
                .resizable()
                .frame(width: 400, height: 900, alignment: .center)
                .scaledToFit()
                .opacity(0.9)
        )
        
    }
    
}

struct QuestionList_Previews: PreviewProvider {
    static var previews: some View {
        QuestionList()
    }
}
