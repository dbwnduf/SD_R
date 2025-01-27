
#install.packages('jsonlite')
#install.packages('wordcloud2')
library('jsonlite') #라이브러리 불러오기
library(wordcloud2) #라이브러리 불러오기

jsonList = fromJSON('시청 기록.json') #SON 포멧의 데이터를 R DARAKRAME으로 변환후 JSONLIST에 저장
listSubtitles<-jsonList["subtitles"]# JSON LIST의 subtitles 부분을 listSubtitles

시청채널<-list()#시청채널 리스트 생성

for (i in 1:dim(listSubtitles)[1]) {
  시청채널<-append(시청채널,listSubtitles[[1]][[i]]$name)#시청 변수 리스트
}

채널시청수<-table(unlist(시청채널))#데이터에서 같은 채널을 본 횟수를 합쳐서 몇번 중복됬는지 계산

wordcount2 <- head(sort(채널시청수, decreasing=T),50)#빈도 수 가 많은 수로 50개 출력
wordcloud2(wordcount2,gridSize=20,size=1,shape="circle")#워드 클라우드 생성모양 = 원모양