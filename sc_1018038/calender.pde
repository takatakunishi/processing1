//一部ヤフー知恵袋より
int daysOfMonth[]={31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
int ye, ye1;
int mo, mo1;
int da, da1;
int ca =30, cb=10, cc=40, cd=20, ce=30+50;
int tes=100;
int calsavedata;
boolean calsele=false, calsele1=false, caltf=false;

void calender() {
  background(0);
  drawrandamcircle();
  chekker();
  drawCalender(ye1, mo1, da1);
  if (bt1("戻る", width-30, 30, 60, 30, 24, 255, 255, 255, 0, 0, 0)&&mousekey1) {
    swikey=0;
  }
}

int zeller(int y, int m, int d) {  // ツェラーの公式による曜日の算出 
  int h;
  if (m<3) {
    m+=12;
    y--;
  }
  h=(d+(m+1)*26/10+(y%100)+(y%100)/4+y/400-2*y/100)%7;
  if (2000<y) {
    h-=1;
  } else {
    if (2000>=y) {
      if (y==2000) {
        if (m<=2) {
          h-=0;
        } else {
          h-=1;
        }
      } else {
        h-=0;
      }
    }
  }

  if (h<0) h+=7;
  return h;
}

boolean isLeapYear(int y) { // うるう年の判別
  if (y%4==0) {
    if (y%100==0&&y%400!=0) {
      return false;
    } else {
      return true;
    }
  } else {
    return true;
  }
}
int getDaysOfMonth( int y, int m) {  // うるう年を考慮して「今月」の日数を求める
  int days=daysOfMonth[m-1];
  if (m==2 && isLeapYear(y)) {
    days++;
  }
  return days;
}
int daysdata=0;
void drawCalender(int y, int m, int d) {  // 「今月」のカレンダーを描画する
  int week=zeller(y, m, 1); // 「今月」1日の曜日を求める  
  int days=getDaysOfMonth(y, m); // 「今月」の日数を求める
  fill(0, 110, 170); // 年/月を緑で表示
  textFont(font2);
  textAlign(CENTER, CENTER);
  textSize(50);
  text(y+"年"+"　　"+m+"月", width/2, height/15);
  textAlign(CORNER, CORNER);
  int cbx=((width-10)/7), cby=(height/7), conY=90;
  for (int i=1; i<=days; i++) {
    fill(255);
    rect((i+week-1)%7*cbx+5, ((i+week-1)/7+2)*cby-25-conY, cbx, cby);


    if (i==d) {// 「今日」なら青字
      fill(0, 0, 255);
    } else {// 「今日」でないなら黒字
      fill(0, 0, 0);
      if ((i+week-1)%7==0) { // 日曜は赤字
        fill(255, 0, 0);
      }
    }
    String dd=(" "+i);
    dd=dd.substring(dd.length()-2);//文字列を右寄せっぽくする
    textSize(24);

    text(dd, (i+week-1)%7*cbx+10, ((i+week-1)/7+2)*cby-conY);
    stroke(0);
  }
}

void calpageturn() {
  if (ca-cc/2<mouseX&&ca+cc/2>mouseX&&cb-cd/2<mouseY&&mouseY<cb+cd/2) {
    if (mo1!=1) {
      mo1=mo1-1;
    } else {
      mo1=12;
      ye1=ye1-1;
    }
  }
  if (ce-cc/2<mouseX&&ce+cc/2>mouseX&&cb-cd/2<mouseY&&mouseY<cb+cd/2) {
    if (mo1!=12) {
      mo1=mo1+1;
    } else {
      mo1=1;
      ye1=ye1+1;
    }
  }
}

void chekker() {
  fill(255);
  rectMode(CENTER);
  rect(ca, cb, cc, cd);
  textAlign(CENTER, CENTER);
  fill(255, 0, 0);
  text("-", ca, cb);
  fill(255);
  rect(ce, cb, cc, cd);
  fill(255, 0, 0);
  text("+", ce, cb);
  if (swikey==4) {
    if (bt1("予定作成", width/2, height-30, 140, 30, 20, 255, 255, 255, 0, 0, 0)&&mousekey1) {
      loacaltas(ye1, mo1, daysdata);
      swikey=6;
    }
  }
  rectMode(CORNER);
  textAlign(CORNER, CORNER);
}

void caldata(boolean a) {
  if (a) {
    println(daysdata);
    calsele=false;
    calsele1=false;
    caltf=false;
  }
}

void rea() {
  int week=zeller(ye1, mo1, 1);

  int days=getDaysOfMonth(ye1, mo1); // 「今月」の日数を求める
  int cbx=((width-10)/7), cby=(height/7), conY=90;
  for (int i=1; i<=days; i++) {    
    if ((i+week-1)%7*cbx+5<mouseX&&((i+week-1)/7+2)*cby-25-conY<mouseY&&
      mouseX<(i+week-1)%7*cbx+5+cbx&&mouseY<((i+week-1)/7+2)*cby-25-conY+cby) {   
      daysdata=i;
      calsele=true;
      caldata(calsele);
    }
  }
}
