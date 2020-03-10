boolean bt(String n, int a, int b, int c, int d, int e, int f, int g, int h, 
  int j, int k, int l) {
  rectMode(CENTER);
  fill(f, g, h);
  rect(a, b, c, d);
  fill(j, k, l);
  textAlign(CENTER, CENTER);
  textSize(e);
  text(n, a, b);
  if (keycon()&&mousePressed&&mouseX>a-c/2&&mouseY>b-d/2&&mouseX<a+c/2&&mouseY<b+d/2) {
    return true;
  } else {
    return false;
  }
}

boolean bt1(String n, int a, int b, int c, int d, int e, int f, int g, int h, 
  int j, int k, int l) {
  rectMode(CENTER);
  fill(f, g, h);
  //rect(a, b, c, d);
  imageMode(CENTER);
  if (mouseX>a-c/2&&mouseY>b-d/2&&mouseX<a+c/2&&mouseY<b+d/2) {
    image(text2, a, b, c, d);
  } else { 
    image(text1, a, b, c, d);
    fill(j, k, l);
    textAlign(CENTER, CENTER);
    textSize(e);
    text(n, a, b);
  }

  imageMode(CORNER);
  if (keycon()&&mousekey1&&mouseX>a-c/2&&mouseY>b-d/2&&mouseX<a+c/2&&mouseY<b+d/2) {
    return true;
  } else {
    return false;
  }
}

boolean bt2(String n, int a, int b, int c, int d, int e, int f, int g, int h, 
  int j, int k, int l) {
  rectMode(CENTER);
  fill(f, g, h);
  //rect(a, b, c, d);
  imageMode(CENTER);
  if (mouseX>a-c/2&&mouseY>b-d/2&&mouseX<a+c/2&&mouseY<b+d/2) {
    image(text2, a, b, c, d);
  } else { 
    image(text1, a, b, c, d);
    fill(j, k, l);
    textAlign(CENTER, CENTER);
    textSize(e);
    text(n, a, b);
  }

  imageMode(CORNER);
  if (mousekey1&&mouseX>a-c/2&&mouseY>b-d/2&&mouseX<a+c/2&&mouseY<b+d/2) {
    return true;
  } else {
    return false;
  }
}
