craps.DontPassLine<-function(prove){
  numVittorie<-0
  num12<-0
  for(i in 1:prove){
    dado1<-sample(1:6,1)
    dado2<-sample(1:6,1)
    sum<-dado1+dado2     
    if(sum==7||sum==11){
      #non si fa nulla
    }else if(sum==2||sum==3){
      numVittorie<-numVittorie+1
    }else if(sum==12){
      num12<-num12+1
    }else{
      while(TRUE){
        dado1<-sample(1:6,1)
        dado2<-sample(1:6,1)
        sommaTemp<-dado1+dado2         
        if(sum==sommaTemp){
          break
        }else if(sommaTemp==7){
          numVittorie<-numVittorie+1
          break
        }else if(sum==12){
          num12<-num12+1
          break
        }
      }
    }
  }
  prob.Vittoria<-(numVittorie/prove)
  prob.Sconfitta<-(prove-numVittorie-num12)/prove
  x<-cat("Vittoria: ",prob.Vittoria,"\nSconfitta:",prob.Sconfitta,"\n")
}

craps.DontPassLine(1000)
craps.DontPassLine(10000)
craps.DontPassLine(20000)
