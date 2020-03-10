
int menuekey=0;
int menuey;
int menueheight=200;

boolean downkey=false;
String []object={"メニュー", "選択画面", "タイマー", "カレンダー"};
void menue() {
  rectMode(CORNER);
  fill(255, 0, 0);
  image(menue,0, menuey, width, height-menuey);
  time(40, width-180, menuey+40);
  switch(menuekey) {
  case 0:
    swipe=0;
    //println(menuey);
    if (mousekeyp&&mouseY<=height&&mouseY>height-20) {
      menuekey=1;
    }

    if (downkey&&menuey!=height) {
      menuey=menuey+30;
      //  println("sss");
      if (menuey>height-1) {
        //   println("ttt");
        downkey=false;
      }
    }

    break;
  case 1:
    swipe=1;
    if (mouseY>height-menueheight&&mousePressed) {
      menuey=mouseY;
    } else if (mousekey1 &&mouseY<height-menueheight) {
      menuey=height-menueheight;
      menuekey=2;
    } else if (mousePressed!=true) {
      menuey=height;
    }
    break;
  case 2:
    // println(true);
    if (mouseY<height-menueheight&&mousekeyp) {
      downkey=true;
      menuekey=0;
    }
  }
  int k=0;
  for (int i=0; i<2; i++) {
    for (int j=0; j<2; j++) {

      fill(255);
      if (bt2(object[j+i*2], 120+240*j, (i+1)*70+menuey, 180, 45, 30, 255, 255, 255, 255, 0, 0)) {

        k=j+i*2;
        //   println(k);
        if (k==0) {
          swikey=0;
        }
        if (k==1) {

          //    println(false);
          swikey=1;
        }
        if (k==2) {
          swikey=2;
        }
        if (k==3) {
          swikey=4;
        }
      }
    }
  }
}
