boolean startstart=false;
float startkey2=0;
float startkey=0;
void startscreen(){
  rectMode(CORNER);
  background(255);
  textSize(50);
  textAlign(CENTER,CENTER);
  if(mousekey1){
    startstart=true;
  }
if(startkey<120){
  fill(0,0,0,255-(startkey/120)*255);
  println(startkey);
  rect(0,0,width,height);
  fill(255);
  text("Are you ready?",width/2,height/2);
}else if(startkey<240){
  fill(0);
  text("Let's start!",width/2,height/2);
}else if(startkey>=240&&startkey<360){
  startkey2+=1;
  fill(0);
  text("Let's start!",width/2,height/2);
  println(startkey2);
  fill(0,0,0,(startkey2/120)*255);
 rect(0,0,width,height);
}else if(startkey>=360){
  image(back1,0,0);
  fill(255);
  text("Please Click",width/2,height/2);
  
  if(mousekey1){
    swikey=0;
  }
}

}
