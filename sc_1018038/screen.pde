void screen_control() {
  switch(swikey) {
  case 100:
  
  startscreen();
  break;
  case 0:
    screen0();
    break;
  case 1:
    screen1();
    break;
  case 2:
    timer();
    break;
  case 3:
    weekselect();
    break;
  case 4:
    calender();
    break;
  case 5:
    doschedul();
    break;
  case 6:
    calendertask();
    break;
  }
}

void screen0() {
  rectMode(CORNER);
  background(0);
  image(back1, 0, 0);
  drawrandamcircle();
  textAlign(CENTER, CENTER);
  fill(0);
  textFont(font2);
  textSize(50);
  text("我のスケジューラー", width/2, 25);
  int boxx=200, boxy=50, boxsy=50;
  for (int i = 0; i<3; i++) {
    textFont(font);
    if (bt1(taskdata[i], width/2, boxsy+boxy*i+10*i+boxy/2, boxx, boxy, 20, 255, 255, 255, 0, 0, 0)&&mousekey1) {
      swikey=5;
      doschekey=3;
      donumber=i;
      backswikey=0;
    }
  }
  textFont(font);
  if (bt1("welcome to hell♡", width/2, height/2+40, 400, 50, 30, 0, 0, 0, 0, 0, 255)&&mousekey1) {
    swikey=1;
  }
  if (bt1("カレンダー", width/2, height/2-30, 250, 50, 25, 255, 255, 255, 0, 0, 0)&&mousekey1) {
    swikey=4;
  }
}

void screenchange1() {
  rectMode(CORNER);
  fill(255, 0, 0);
  rect(width/2-150, height/2+25, 300, 30);
  if (width/2-150<mouseX&& height/2+25<mouseY&& mouseX<width/2-150+300&& mouseY<height/2+25+40) {
    if (lockmouse==0&&keycon()&&mousePressed) {
      swikey=1;
    }
  }
}

int cliche=0;
void screen1() {
  if (mousePressed!=true) {
    cliche=1;
  }

  String []ws1 ={"もどる", "予定を立てる", "タイマー", "見返し"};
  background(0);
  drawrandamcircle();
  if (bt1(ws1[0], width-60, 17, 110, 30, 20, 255, 255, 255, 0, 0, 0)&&mousekey1) {
    swikey=0;
  }
  if (cliche==1&&bt1(ws1[1], width/2, 150, 300, 70, 40, 255, 255, 255, 0, 0, 0)) {
    swikey=3;
    cliche=0;
  }
  if (bt1(ws1[2], width/2, 350, 300, 70, 40, 255, 255, 255, 0, 0, 0)&&mousekey1) {
    swikey=2;
    cliche=0;
    timerreset();
  }
  /*if (cliche==1&&bt(ws1[3], width/2+50, 420, 200, 40, 30, 255, 255, 255, 0, 0, 0)) {
   swikey=0;
   cliche=0;
   }*/
  if (bt1("予定をこなす", width/2, 250, 300, 70, 40, 255, 255, 255, 0, 0, 0)&&mousekey1) {
    swikey=5;
    doschekey=0;
  }
}



void timer() {
  image(back1, 0, 0, back1.width, back1.height);

  if (swikey==2) {
    if (bt1("戻る", width-60, 17, 110, 25, 20, 255, 255, 255, 0, 0, 0)&&mousekey1) {
      swikey=1;
    }
  }
  timercontrol();
  timerswitch();
  timerset(dividedtime1) ;
}

int bb= 100;
int conkey =0;
int bokey =0;
int tn=30, tm=80;


void weekselect() {
  rectMode(CORNER);
  background(0);
  drawrandamcircle();
  image(chara, 45, 45, chara.width*0.5, chara.height*0.5);
  if (bt1("メニュー画面へ", width-60, 25, 120, 20, 15, 255, 255, 255, 0, 0, 0)) {
    swikey=1;
  }


  if (mousePressed&&bokey==3) {
    bb=100;
    bokey=0;
  }

  for (int j=0; j<2; j++) {
    for (int i=0; i<days.length; i++) {

      if (bt1(days[i], 50+60*i, 50+350*j, 50, 30, 20, 255, 255, 255, 0, 0, 0)) {
        if (j==0) {
          bb=i;
        } else {
          bb=7+i;
        }
      }

      if (bb!=100) { 
        rectMode(CORNER);        
        fill(255);
        stroke(0);
        if (mousePressed!=true) {
          conkey=0;
          tas=100;
        }
        rectMode(CORNER);
        rect(tn, tm, width-tn-20, 290);
        fill(255, 0, 0);
        text("第"+str(bb/7+1)+"週"+days[bb%7]+"曜日", tn+300, tm+20);

        for (int k= 0; k<9; k++) {
          int sss=tn+270, ttt=tm+60+20*k;
          fill((col[k]-v)/b, (col[k]-col[k]/b*b)/n, col[k]-col[k]/n*n);
          textSize(15);
          textAlign(CORNER, CENTER);
          text(task[k], sss+65, ttt+10);
          stroke(0);
          rectMode(CORNER);
          rect(sss, ttt, 60, 20);
          if (keycon()&&mousePressed&&conkey==0&&
            sss<mouseX&&ttt<mouseY&&mouseX<sss+60&&mouseY<ttt+20) {
            tas=k;
            datasave();
            dataload();
            conkey=1;
          }
        }

        for (int un =0; un<24; un++) {    
          int btfx=tn+30+120*(un/12), btfy= tm+10+20*(un%12), btfxs=60, btfys=20;
          stroke(0);
          fill((schecol[bb][un]-v)/b, (schecol[bb][un]-schecol[bb][un]/b*b)/n, schecol[bb][un]-schecol[bb][un]/n*n);
          rect(btfx, btfy, btfxs, btfys);
          fill(0);
          textSize(15);
          textAlign(CENTER);
          text(un, btfx-10, btfy+10);
        }
        stroke(0);
        checker();
        if (bt("閉じる", width-tn-40, tm+40, 50, 20, 15, 255, 255, 255, 0, 0, 0)) {
          bokey=3;
        }
      }
    }
  }
}


void todaydolist() {
  background(0);
  drawrandamcircle() ;
  for (int i=0; i<15; i++) {
    if (bt1("戻る", width-30, 30, 60, 30, 24, 255, 255, 255, 0, 0, 0)&&mousekey1) {
      doschekey=0;
    } 
    // println(i,taskdata);
    if (bt1(taskdata[i], width/2, 100+35*i, 200, 30, 15, 
      255, 255, 255, 0, 0, 0)&&mousekey1) {
      doschekey=3;
      donumber=i;
      backswikey=5;
    }
  }
}

void doschedultimer() {
  background(0);
  image(back1, 0, 0);
  textAlign(CENTER, CENTER);
  fill(30, 10, 44);
  textSize(20);
  text(taskdata[donumber], width/2, 30);
  timercontrol();
  timerswitch();
  timerset(dividedtime1) ;
  if (bt1("この課題を達成とみなす", width-150, 200, 280, 40, 25, 255, 255, 255, 0, 0, 0)&&mousekey1) {
    concalA=11;
    concal=donumber;
    da1=daysdata;
    savcaltas();
  }
  if (bt1("戻る", width-30, 30, 60, 30, 24, 255, 255, 255, 0, 0, 0)&&mousekey1) {
    if (backswikey==0) {
      swikey=0;
    } else {
      doschekey=2;
    }
  }
}

int donumber;
int doschescreenkey=0;
int doschekey =0;
void doschedul() {
  rectMode(CENTER);
  background(0);
  switch(doschekey) {
  case 0:
    drawrandamcircle() ;
    if (bt1("今日の課題をこなす", width/2, 200, 350, 50, 30, 
      255, 255, 255, 0, 0, 0)) {
      rea();
      if (mousekey1) {
        mo1=mo;
        ye1=ye;         
        loacaltas(ye, mo, da);
        doschekey=2;
      }
    }      
    if (bt1("今日以外の課題をこなす", width/2, 100, 350, 50, 30, 
      255, 255, 255, 0, 0, 0)) {
      if (mousekey1) {
        rea();
        doschekey=1;
      }
    }
    if (bt1("戻る", width-30, 30, 60, 30, 24, 255, 255, 255, 0, 0, 0)&&mousekey1) {
      swikey=1;
    }

    break;    
  case 1:
    if (mousekey1) {
      println(true);
      calpageturn();
      rea();
    }
    calender();
    if (bt1(ye1+"年"+mo1+"月"+daysdata, width/2-40, height-30, 200, 30, 20, 255, 255, 255, 0, 0, 0)&&mousekey1) {
      loacaltas(ye1, mo1, daysdata);
      doschekey=2;
    } 

    break;
  case 2:
    todaydolist();
    break;
  case 3:
    doschedultimer();
    break;
  }
}
