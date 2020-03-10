int minutecontrol1=0;
int minutecontrol2=0;
int hourcontrol1=0;
int hourcontrol2=0;
boolean charatimer=false;
boolean charatimer1=false;
void timercontrol() {
  int centerx1=40;
  int centerx2=150;
  int centery=100;
  int boxsizex=60;
  int boxsizey=30;
  int boxdistance=40;
  int textsize1=30;
  int selectdistance=40;
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  fill(0, 0, 255);
  image(text3, centerx1, centery-boxdistance, boxsizex, boxsizey);
  text("+", centerx1, centery-boxdistance+10);
  image(text3, centerx1, centery-boxdistance-selectdistance, boxsizex, boxsizey);
  text("+10", centerx1, centery-boxdistance-selectdistance+10);
  image(text3, centerx2, centery-boxdistance, boxsizex, boxsizey);
  text("+", centerx2, centery-boxdistance+10);
  image(text3, centerx2, centery-boxdistance-selectdistance, boxsizex, boxsizey);
  text("+10", centerx2, centery-boxdistance-selectdistance+10);
  image(text3, centerx1, centery+boxdistance, boxsizex, boxsizey);
  text("-", centerx1, centery+boxdistance+10);
  image(text3, centerx1, centery+boxdistance+selectdistance, boxsizex, boxsizey);
  text("-10", centerx1, centery+boxdistance+selectdistance+10);
  image(text3, centerx2, centery+boxdistance, boxsizex, boxsizey);
  text("-", centerx2, centery+boxdistance+10);
  image(text3, centerx2, centery+boxdistance+selectdistance, boxsizex, boxsizey);
  text("-10", centerx2, centery+boxdistance+selectdistance+10);
  textAlign(CORNER);
  imageMode(CORNER);
  fill(255);
  textSize(25);
  textAlign(CENTER, CENTER);
  text(str(hourcontrol2)+str(hourcontrol1)+"時間", centerx1, centery);
  text(str(minutecontrol2)+str(minutecontrol1)+"分", centerx2, centery);
  if (timerengine2!=true&&centerx1-boxsizex/2<mouseX&&centerx1+boxsizex/2>mouseX&&mousekey1) {
    if (centery-boxdistance-boxsizey/2<mouseY&&centery-boxdistance+boxsizey/2>mouseY) {
      if (hourcontrol1<=9) {
        hourcontrol1+=1;
      }
      if (hourcontrol1>9) {
        if (hourcontrol2<9) {
          hourcontrol2+=1;
        }
        hourcontrol1=0;
      }
    }

    if (centery-boxdistance-selectdistance-boxsizey/2<mouseY&&centery-boxdistance-selectdistance+boxsizey/2>mouseY) {
      if (hourcontrol2<9) {
        hourcontrol2+=1;
      }
    }

    if (centery+boxdistance-boxsizey/2<mouseY&&centery+boxdistance+boxsizey/2>mouseY) {
      if (hourcontrol1==0&&hourcontrol2==0) {
      } else {
        if (hourcontrol1>0) {
          hourcontrol1-=1;
        } else {
          if (hourcontrol2>0) {
            hourcontrol2-=1;
          }
          hourcontrol1=9;
        }
      }
    }


    if (centery+boxdistance+selectdistance-boxsizey/2<mouseY&&centery+boxdistance+selectdistance+boxsizey/2>mouseY) {
      if (hourcontrol2>0) {
        hourcontrol2-=1;
      }
    }
  }


  if (timerengine2!=true&&centerx2-boxsizex/2<mouseX&&centerx2+boxsizex/2>mouseX&&mousekey1) {
    if (centery-boxdistance-boxsizey/2<mouseY&&centery-boxdistance+boxsizey/2>mouseY) {
      if (minutecontrol1<=9) {
        minutecontrol1+=1;
      }
      if (minutecontrol1>9) {
        if (minutecontrol2<5) {
          minutecontrol2+=1;
        }
        minutecontrol1=0;
      }
    }

    if (centery-boxdistance-selectdistance-boxsizey/2<mouseY&&centery-boxdistance-selectdistance+boxsizey/2>mouseY) {
      if (minutecontrol2<5) {
        minutecontrol2+=1;
      }
    }

    if (centery+boxdistance-boxsizey/2<mouseY&&centery+boxdistance+boxsizey/2>mouseY) {
      if (minutecontrol1==0&&minutecontrol2==0) {
      } else {
        if (minutecontrol1>0) {
          minutecontrol1-=1;
        } else {
          if (minutecontrol2>0) {
            minutecontrol2-=1;
          }
          minutecontrol1=9;
        }
      }
    }

    if (centery+boxdistance+selectdistance-boxsizey/2<mouseY&&centery+boxdistance+selectdistance+boxsizey/2>mouseY) {
      if (minutecontrol2>0) {
        minutecontrol2-=1;
      }
    }
  }

  timer(hourcontrol2*10+hourcontrol1, minutecontrol2*10+minutecontrol1);
}

boolean timerengine1=false;
boolean timerengine2=false;
boolean timerengine3=false;
void timerswitch() {
  int timersizex=60;
  int timersizey=40;
  int timerx2=205;
  int timery2=70;
  rectMode(CORNER);
  imageMode(CORNER);
  image(text4, timerx2, timery2, timersizex, timersizey);
  fill(255);
  //rect(timerx2, timery2, timersizex, timersizey);
  if (mousekey1&&timerengine2!=true&&mouseX>timerx2&&mouseX<timerx2+timersizex&&mouseY>timery2&&mouseY<timery2+timersizey) {
    timerengine1=true;
    timerengine2=true;
    println("timerswitchtrue");
  }
}

int dividedtime1=0;
int timerstart=0;
int dividedtime=0;
void timer(int timerhour, int timerminute) {
  int purposetime;
  purposetime=timerhour*1000*60*60+timerminute*1000*60;
  if (timerengine1) {
    charatimer=false;
    timerstart=millis();
    purposetime=timerhour*1000*60*60+timerminute*1000*60;
    dividedtime1=purposetime;
    println(timerstart);
    println(timerminute, timerhour);
    timerengine3=true;
    timerengine1=false;
  }



  if (timerengine2) {
    if (purposetime-(millis()-timerstart)>0) {
      dividedtime=purposetime-(millis()-timerstart);
    } else {
      dividedtime=0;
      timerengine2=false;
      charatimer=true;
      charatimer1=true;
    }
  }
  fill(255);
  timerfake(dividedtime);
}

int hou=0;
int min=0;
int sec=0;

void timerfake(int milli) {
  hou=milli/1000/60/60;
  min=milli/1000/60%60;
  sec=milli/1000%60%60;
  println(hou, min, sec);
  fill(255);
  textSize(50);
  textAlign(CENTER, CENTER);
  text(conv(hou)+":"+conv(min)+":"+conv(sec), width/2, height/2-30);
}

String conv(int i) {
  String s1, s2;
  // int n1=i/10,n2=i%10;
  /* i が1桁のときに 01 のように2桁で表示する */
  s1 = String.valueOf(i / 10);
  s2 = String.valueOf(i% 10);
  /* String 同士を足すと 2つの文字列がつながる */
  return s1+s2;
}

void timerreset() {
  minutecontrol1=0;
  minutecontrol2=0;
  hourcontrol1=0;
  hourcontrol2=0;
  timerengine1=false;
  timerengine2=false;
  timerengine3=false;
  dividedtime1=0;
  timerstart=0;
  dividedtime=0;
  hou=0;
  min=0;
  sec=0;
}
