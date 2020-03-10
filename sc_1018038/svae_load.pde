void datasave() {
  String weekplans[][]=new String[14][24];
  for (int i=0; i<14; i++) {
    for (int j = 0; j<24; j++) {
      weekplans[i][j] =  str(schecol[i][j]);
    }
  }
  for (int i=0; i<14; i++) {
    for (int j = 0; j<24; j++) {
      saveStrings("week"+i+"_1018038.txt", weekplans[i]);
    }
  }
}

void dataload() {
  String []schenu=new String[24];
  int [] schenu1 =new int[24];
  for (int i=0; i<14; i++) {
    schenu=loadStrings("week"+i+"_1018038.txt");
    schenu1 = int (schenu);
    for (int j=0; j<24; j++) {
      schecol[i]=schenu1;
    }
  }
}
