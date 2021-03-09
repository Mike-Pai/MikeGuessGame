//
//  ContentView.swift
//  MikeGuessGame
//
//  Created by 白謹瑜 on 2021/3/5.
//

import SwiftUI
import AVFoundation

var guessQuestions = [
    GuessQuestion(question: "問題：哪種毒藥是最容易買到也最容易毒死人的？", answer: "C氰酸鉀", choseAnser1: "A.農藥", choseAnser2: "B.威而剛", choseAnser3: "C. 氰酸鉀",picture: "氰酸鉀"),
    GuessQuestion(question: "問題：要如何才能發現到真正的兇手？", answer: "C背後一道光線射過", choseAnser1: "A.找到證據", choseAnser2: "B.套話", choseAnser3: "C.背後一道光線射過",picture: "背後一道光線射過"),
    GuessQuestion(question: "問題：身為柯南的好夥伴的阿笠博士真實身分應該是?", answer: "C有頭髮的小叮噹", choseAnser1: "A.黑衣組織的頭目", choseAnser2: "B.比較聰明的達文西", choseAnser3: "C.有頭髮的小叮噹",picture: "有頭髮的小叮噹"),
    GuessQuestion(question: "問題：每個兇手都有一個共同特徵，請問那個特徵是什麼？", answer: "C是黑色的人", choseAnser1: "A.是外星人", choseAnser2: "B.是藍星人", choseAnser3: "C.是黑色的人", picture: "是黑色的人"),
    GuessQuestion(question: "問題：柯南不敢對小蘭說出真相的原因是?", answer: "C不能跟小蘭洗鴛鴦浴", choseAnser1: "A.怕小蘭遇難", choseAnser2: "B.怕黑衣組織找他麻煩", choseAnser3: "C.不能跟小蘭洗鴛鴦浴😏",picture: "不能跟小蘭洗鴛鴦浴"),
    GuessQuestion(question: "問題：毛利小五郎未來可能的最大困擾是什麼?", answer: "C動手術時麻醉藥失效", choseAnser1: "A.沒有女人緣", choseAnser2: "B.失眠", choseAnser3: "C.動手術時麻醉藥失效",picture: "動手術時麻醉藥失效"),
    GuessQuestion(question: "問題：柯南一身絕技，請問他是在哪裡學到的？", answer: "C夏威夷", choseAnser1: "A.學校", choseAnser2: "B.補習班", choseAnser3: "C.夏威夷",picture: "夏威夷"),
    GuessQuestion(question: "問題：世界上人口最多的地區是?", answer: "C米花市", choseAnser1: "A.北京", choseAnser2: "B.紐約", choseAnser3: "C.米花市", picture: "米花市"),
    GuessQuestion(question: "問題：當一個人因為做錯是被其他人笑，他最有可能的反應是？", answer: "C殺了他", choseAnser1: "A.我好慚愧", choseAnser2: "B.笑三小", choseAnser3: "C.殺了他" ,picture: "殺了他"),
    GuessQuestion(question: "問題：誰才是《名偵探柯南》中的女主角？", answer: "廢話當然是小蘭，誰敢選別的妳試試～～～新蘭黨們站出來", choseAnser1: "A.步美", choseAnser2: "B.小蘭", choseAnser3: "C.灰原哀",picture: "紅之校外旅行"),
    GuessQuestion(question: "挑戰題：哪項關於灰原哀的敘述是「錯誤」的？", answer: "C.姐姐為宮野志保", choseAnser1: "A.偶像是比護隆佑", choseAnser2: "B.討厭靜電", choseAnser3: "C.姐姐為宮野志保", picture: "姐姐為宮野志保"),
    GuessQuestion(question: "挑戰題：怪盜基德「沒有」假扮過誰？", answer: "B. 服部平次，是不是以為是元太啊！！", choseAnser1: "A. 遠山和葉", choseAnser2: "B. 服部平次", choseAnser3: "C. 小島元太" ,picture: "服部平次"),
    
]


struct ContentView: View {
    @State var question = [
        guessQuestions[0],
        guessQuestions[1],
        guessQuestions[2],
        guessQuestions[3],
        guessQuestions[4],
        guessQuestions[5],
        guessQuestions[6],
        guessQuestions[7],
        guessQuestions[8],
        guessQuestions[9],
    ]
    @State private var showQuestionList = false
    @State private var showAnswer = false
    @State private var questionNumber = 0;
    var body: some View {
        VStack(alignment: .center) {
            HStack{
                Image("偵探-removebg-preview")
                    .resizable()
                    .frame(width: 80, height: 80)
                Text("柯南猜猜猜第\(questionNumber + 1)題")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                
            }
            HStack {
                Spacer()
                Button(action: {
                    showQuestionList = true
                }) {
                    Image(systemName: "text.book.closed")
                }
                .padding()
                .foregroundColor(.white)
                Button(action: {
                    if questionNumber != 0{
                        questionNumber = questionNumber - 1
                        showAnswer = false
                    }
                }) {
                    Image(systemName: "arrow.left.square.fill")
                }
                .padding()
                .foregroundColor(.white)
                Button(action: {
                    guessQuestions.shuffle()
                    question = [
                        guessQuestions[0],
                        guessQuestions[1],
                        guessQuestions[2],
                        guessQuestions[3],
                        guessQuestions[4],
                        guessQuestions[5],
                        guessQuestions[6],
                        guessQuestions[7],
                        guessQuestions[8],
                        guessQuestions[9],
                    ]
                    questionNumber = 0
                    showAnswer = false
                    
                }) {
                    Text("重新開始")
                }
                .padding()
                .foregroundColor(.white)
                Button(action: {
                    if questionNumber != 9{
                        questionNumber = questionNumber + 1
                        showAnswer = false
                    }
                }) {
                    Image(systemName: "arrow.right.square.fill")
                }
                .padding()
                .foregroundColor(.white)
                Spacer()
            }
            .background(Color.blue)
            .offset(y:10)
            ScrollView{
                VStack(alignment: .center, spacing: 20){
                    VStack(alignment: .center, spacing: 20){
                    Text(question[questionNumber].question)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundColor(Color.black)
                        .padding([.top, .leading, .trailing])
                    Text(question[questionNumber].choseAnser1)
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color.black)
                    Text(question[questionNumber].choseAnser2)
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color.black)
                    Text(question[questionNumber].choseAnser3)
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color.black)
                    }
                    if showAnswer == true {
                        Text("答案：\(question[questionNumber].answer)")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.red)
                        Image(question[questionNumber].picture ?? "")
                            .resizable()
                            .frame(width: 250, height: 250, alignment: .leading)
                    }
                    HStack{
                        Spacer()
                        Button(action: {
                            if showAnswer == false {
                                showAnswer = true
                            }else{
                                showAnswer = false
                            }
                        }, label: {
                            HStack{
                                if showAnswer == false{
                                    Text("看答案")
                                        .font(.title)
                                        .foregroundColor(.black)
                                        .padding(.leading)
                                }else {
                                    Text("隱藏")
                                        .font(.title)
                                        .foregroundColor(.black)
                                        .padding(.leading)
                                }
                                Image(systemName: "hand.point.up.left.fill")
                                    .resizable()
                                    .frame(width: 35, height: 35, alignment: .leading)
                                    .foregroundColor(.black)
                                    .padding(.trailing)
                            }
                        })
                        .background(
                            Rectangle()
                                .cornerRadius(20)
                                .foregroundColor(.orange)
                                
                        )
                        .opacity(0.8)
                        Spacer()
                        Button(action: {
                            if questionNumber != 9{
                                questionNumber = questionNumber + 1
                                let utterance =  AVSpeechUtterance(string: question[questionNumber].question+question[questionNumber].choseAnser1+question[questionNumber].choseAnser2+question[questionNumber].choseAnser3)
                                    utterance.pitchMultiplier = 1
                                    utterance.rate = 0.4
                                    utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
                                    let synthesizer = AVSpeechSynthesizer()
                                    synthesizer.speak(utterance)
                                
                                
                                showAnswer = false
                                
                            }
                        }, label: {
                            Text("下一題")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding(.horizontal)
                        })
                        .background(
                            Rectangle()
                                .cornerRadius(20)
                                .foregroundColor(.orange)
                        )
                        Spacer()
                        
                    }
                    
                    
                }
                Spacer()
            }
        }
        .onAppear(){
            guessQuestions.shuffle()
            question = [
                guessQuestions[0],
                guessQuestions[1],
                guessQuestions[2],
                guessQuestions[3],
                guessQuestions[4],
                guessQuestions[5],
                guessQuestions[6],
                guessQuestions[7],
                guessQuestions[8],
                guessQuestions[9],
            ]
        }
        .background(
            Image("筆記")
                .resizable()
                .scaledToFill()
                .opacity(0.8)
                .ignoresSafeArea()
        )
        .sheet(isPresented: $showQuestionList, content: {
            QuestionList()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
