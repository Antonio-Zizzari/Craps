craps.PassLine<-function(prove){
 numVittorie<-0
 
 for(i in 1:prove){
   dado1<-sample(1:6,1)
   dado2<-sample(1:6,1)
   sum<-dado1+dado2
   
   if(sum==7||sum==11){
     numVittorie<-numVittorie+1
   }else if(sum==2||sum==3||sum==12){
     #non si fa nulla
   }else{
     while(TRUE){
       dado1<-sample(1:6,1)
       dado2<-sample(1:6,1)
       sommaTemp<-dado1+dado2
       
       if(sum==sommaTemp){
         numVittorie<-numVittorie+1
         break
       }else if(sommaTemp==7)
         break
     }
   }
 }
 prob.Vittoria<-numVittorie/prove
 prob.Sconfitta<-(prove-numVittorie)/prove
 x<-cat("Vittoria: ",prob.Vittoria,"\nSconfitta:",prob.Sconfitta,"\n")
}

craps.PassLine(1000)
craps.PassLine(10000)
craps.PassLine(20000)