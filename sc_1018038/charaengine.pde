float charax=270;
float charay=450;
float charasize = 0.3;
float distancecharax=0;
float distancecharay=0;
void charagrip(float chx, float chy, float chwid, float chhei) {

  if (mousekeyp) {
    distancecharax=mouseX-(chx-chwid/2);
    distancecharay=mouseY-(chy-chhei/2);
    //println(distancecharax, distancecharay);
  } else if (mousePressed) {
    //println(distancecharax,distancecharay);
    if (chx-chwid/2<mouseX&&chx+chwid/2>mouseX&&chy-chhei/2<mouseY&&chy+chhei/2>mouseY) {
      charax=mouseX-distancecharax;
      charay=mouseY-distancecharay;
    }
  }
}

void charamake(float chax, float chay, float chasize) {
  if (charatimer) {
    charatime+=1;
    if (charatimer1) {
      charatime=0;
      charatimer1=false;
    }
    if ((charatime/30)%3==0) {
      image (chara3, chax, chay, chara.width*chasize, chara.height*chasize);
    } else {
      image  (chara2, chax, chay, chara.width*chasize, chara.height*chasize);
    }
  } else {
    image(chara, chax, chay, chara.width*chasize, chara.height*chasize);
  }
  charagrip(chax+chara.width*chasize/2, chay+chara.height*chasize/2, chara.width*chasize, chara.height*chasize);
  stroke(255);
  textcon(message, 15, chax, chay+chara.height*chasize/2);
}


int cnt=0;
String []message;
int cnt1[]=new int[15];
PFont font1;
int textline=1;
int maxtext=0;
int charatime=0;
void textcon(String message[], int textsizeB, float textx, float texty) {

  int maxtextlength=message[1].length();
  float lines=(texty-(textsizeB*(message.length-1))/2)+textsizeB/2;
  for (int i=1; i<message.length; i++) {
    if (maxtextlength<message[i].length()) {
      maxtextlength=message[i].length();
    }
  }
  fill(255);
  rectMode(CENTER);

  rect(textx-textsizeB*maxtextlength/2, texty, textsizeB*maxtextlength, 20*message.length);

  if (textcheck==0) {
    for (int i=0; i<cnt1.length; i++) {
      cnt1[i]=0;
    }
    textline=1;
    textcheck=1;
  }  

  for (int i=1; i<=textline; i++) {
    if (textDisp(message[i], cnt1[i], textsizeB, textx-textsizeB*maxtextlength/2, lines+20*(i-1), maxtext)) {
      if (textline<message.length-1) {
        textline=i+1;
      }
    }
  }
  maxtext=maxtextlength;
  textcontrol(textx-textsizeB*maxtextlength/2, texty, textsizeB*maxtextlength, textsizeB*message.length);
}

boolean textDisp(String message, int cnt, int textsizeA, float textside, float textcenterline, int max) {
  int s=0;  
  for (int i=0; i<message.length(); i++) {
    if (cnt>10*i) {
      fill(0);
      textAlign(CORNER, CORNER);
      textSize(textsizeA);
      text(message.charAt(i), textside-textsizeA*max/2+i*textsizeA, textcenterline);
      s=i;
    }
  }
  if (s!=message.length()-1) {  
    return false;
  } else {
    return true;
  }
}


int textkey=1;
int textcheck=1;
void textcontrol(float textboxcenterx, float textboxcentery, float textboxwidth, float textboxheight) {


  if (swikey==0) {
    message=loadStrings("message1.txt");
  }

  if (swikey==1) {
    message=loadStrings("message3.txt");
  }  
  if (swikey==2) {
    message=loadStrings("message4.txt");
  }
  if (swikey==3) {
    message=loadStrings("message5.txt");
  }
  if (swikey==4) {
    message=loadStrings("message6.txt");
  }
  if (swikey==5) {
    if (doschekey==0) {
      message=loadStrings("message7.txt");
    } else if (doschekey==1) {
      message=loadStrings("message9.txt");
    } else if (doschekey==2) {
      message=loadStrings("message8.txt");
    } else if (doschekey ==3) {
      message=loadStrings("message10.txt");
    }
  }
}
