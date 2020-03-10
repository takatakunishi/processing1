int v=1000000000, b=1000000, n=1000;
int []col = {1116169214, 1239170066, 1032000152, 1239117188, 
  1071234126, 1178000008, 1224234058, 1051096069, 1071030071};
int [][]schecol = new int [14][24];
int cli=0;
int x = 0;
int swikey=100;
int timemil;
int yu=0;
int nx=0; 
int lockmouse=0;
String []days = {"月", "火", "水", "木", "金", "土", "日"};
String []task = {"睡眠", "食事", "勉強", "バイト", "移動", "大学", "趣味", "約束", "その他"};
PImage chara, back1, text1, text2, text3, text4, chara2, chara3,menue;
PFont font, font2;
boolean mousekey1 = false;
int mousekey2=0;
int mousekey3=0;
boolean mousekeyp=false;
String nasi[];
int backswikey=0;
int backdoschekey=0;
int preswikey=0;
void setup() {
  message=loadStrings("message1.txt");
  size(480, 640);
  background(0);
  noStroke();
  fill(102);
  menuey=height;
  font = createFont("MS Gothic", 28, true);   //文字設定
  font2 = createFont("HGGyoshotai", 28, true);
  textFont(font);
  textFont(font2);
  dataload();
  chara = loadImage("masukotto.png");
  back1 = loadImage("kabegami2.jpg");
  text1=loadImage("tekisuto.jpg");
  text2=loadImage("tekisuto1.jpg");
  text3=loadImage("text3.jpg");
  text4=loadImage("text4.jpg");
  chara2=loadImage("masukotto3.png");
  chara3 = loadImage("masukotto1.png");
  menue=loadImage("menue.jpg");
  mo=month();
  ye=year();
  da=day();
  ye1=ye;
  da1=da;
  mo1=mo;
  daysdata=da1;
  concal=100;
  concalA=100;  
  loacaltas(ye1, mo1, da);
  for (int i=0; i<cnt1.length; i++) {
    cnt1[i]=0;
  }
}

void mousecontrol1() {
  if (mousePressed!=true&&mousekey2==1) {
    mousekey1=true;
    mousekey2=0;
  } else {
    mousekey1=false;
  }
  if (mousePressed==true&&mousekey3==1) {
    mousekeyp=true;
    mousekey3=0;
  } else {
    mousekeyp=false;
  }
}


void mouseReleased() { 
  mousekey2=1;

  if (tas!=100&&keycon()) {
    for (int un =0; un<24; un++) {
      int btfx=tn+30+120*(un/12), btfy= tm+10+20*(un%12), btfxs=60, btfys=20;
      if (keycon()&&btfx<mouseX&&btfy<mouseY&&
        mouseX<btfx+btfxs&&mouseY<btfy+btfys) {
        schecol[bb][un]=col[tas];
        datasave();
        //println( schecol[0][un]);
      }
    }
  }
  lockmouse=0;
}

int swipe=0;
int ran=400;
void mousePressed() {
  mousekey3=1;
  if (swikey==0) {
    //screenchange1();
  }
  if (swikey==4) {
    calpageturn();
    calsele1=true;
    rea();
  }

  if (swikey==6) {
    m1();
  }
  if (mouseY<=height&&mouseY>=height-20) {
    swipe=1;
  } else {
    if (mouseY<my) {
      swipe=0;
      my=0;
    }
  }
  lockmouse=1;
}
int my=0;
/*void menue() {
 rectMode(CORNER);
 if (swipe==1) {
 if (mousePressed&&height-ran<=mouseY) {
 my=mouseY;
 } else if (mousePressed&&mouseY>0) {
 my=height-ran;
 }
 } else {
 my=0;
 }
 
 if (my>0) {
 if (my<height) {
 fill(255, 0, 0);
 rect(0, my, width, height-my);
 if (mousePressed) {
 }
 }
 }
 }*/

int keyconnum=1000;
boolean keycon() {
  if (swipe==1) {
    return false;
  } else {
    return true;
  }
}


void timerset(int a) { 
  /*
  if (timerengine3) {
   timemil = a *1000*60;
   
   yu=1;
   timerengine3=false;
   }
   if (yu==1) {
   nx=millis()+timemil;
   yu=0;
   }
   
   int an=0;
   float bn=0;
   if (nx-millis()>=0) {
   an=nx-millis();
   bn=an*1.0/timemil*400;
   }*/
  int timerlong=350;
  float timermax;
  float timerratio;
  float ratio;
  timermax=a;
  timerratio=dividedtime;
  ratio=timerratio/timermax;
  println(ratio);
  beginShape();
  fill(255);
  vertex(30, 550-timerlong*ratio);
  vertex(130, 600-timerlong*ratio);
  vertex(130, 600);
  vertex(30, 550);
  endShape(CLOSE);
}

int tas=100;
void checker() {
  if (tas!=100) {    
    rectMode(CENTER);
    // println((col[tas]-v)/b, (col[tas]-col[tas]/b*b)/n, col[tas]-col[tas]/n*n);
    fill((col[tas]-v)/b, (col[tas]-col[tas]/b*b)/n, col[tas]-col[tas]/n*n);
    rect(mouseX, mouseY, 60, 20);
    // println(tas);
  }
}

int stset =50;
float counteli = 0;
float elico2[]= new float [stset];
float elicox[]=  new float [stset];
float elicoy[]=  new float [stset];
float elisize[] =  new float [stset];
float elicor[]= new float [stset];
float elicob[]=  new float [stset];
float elicog[] =  new float [stset];
float ellipsetime = 600;
void drawrandamcircle() {
  counteli+=1;
  if (counteli==1) {
    for (int i =0; i<stset; i++) {
      elico2[i]=random(20, 150);
      elicox[i]=random(-width, width/2);
      elicoy[i]=random(0, height);
      elicor[i]=random(20, 255);
      elicog[i]=random(20, 255);
      elicob[i]=random(20, 255);
    }
  }
  if (counteli<ellipsetime) {
    for (int i =0; i<stset; i++) {

      elicox[i]+=1;
      noStroke();
      if (counteli<ellipsetime/2) {
        fill(elicor[i], elicog[i], elicob[i], 160);
        ellipse(elicox[i], elicoy[i], elico2[i]*(counteli/(ellipsetime/2)), elico2[i]*(counteli/(ellipsetime/2)));
      } else {

        fill(elicor[i], elicog[i], elicob[i], 160);
        ellipse(elicox[i], elicoy[i], elico2[i]*((ellipsetime-counteli)/(ellipsetime/2)), elico2[i]*((ellipsetime-counteli)/(ellipsetime/2)));
      }  

      if (counteli==ellipsetime-1) {
        elicox[i]=0;
        counteli=0;
      }
    }
  }
}
int predoschekey=0;
void smallmovereset() {
  if (doschekey!=predoschekey) {
    textkey=1;
    textcheck=0;
    predoschekey=doschekey ;
    charatimer=false;
  }
}


void movereset() {
  if (swikey!=preswikey) {
    if (swikey==0) {
      daysdata=da;
      ye1=ye;
      mo1=mo;
      loacaltas(ye1, mo1, daysdata);
      charatimer=false;
    }
    if (swikey==4) {
      da1=da;
    }
    println(swikey, preswikey);
    //concalA=100;
   // concal=100;
    textcheck=0;
    preswikey=swikey;
    bb=100;
    timerreset();
  }
}

void time(int timesize, int timex, int timey) {
  textSize(timesize);
  fill(255);
  text(hour()+":"+str(minute()/10)+str(minute()%10)+":"+str(second()/10)+str(second()%10), timex, timey) ;
}


void draw() {
  if(startstart){
  startkey+=1;
  }
  for (int i=1; i<=textline; i++) {
    cnt1[i]+=1;
  }
  smallmovereset();
  movereset();
  mousecontrol1();
  stroke(0);
  screen_control();
  keycon();
  if(swikey!=100){
  charamake(charax, charay, charasize);
  }
  menue();
}
