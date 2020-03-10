String taskdata[]=new String[15];
String loadfake[]=new String[31];
String savefake="a";
void savedatastart() {
  for (int j=ye-1; j<ye+2; j++) {
    for (int l=1; l<12+1; l++) {
      String savesum = str(j)+str(l); 
      for (int g=0; g<31; g++) {
        for (int i = 0; i<taskdata.length; i++) {
          if (i==0) {
            savefake="なし";
            //println(savefake);
          } else {
            savefake+=","+"なし";
            //println(savefake);
          }
          loadfake[g]=savefake;
        }
      }
      saveStrings("caltas"+savesum+".txt", loadfake);
    }
  }
}

void loadcaltas1() {
  String loadsam = str(ye1)+str(mo1);
  //println(loadsam);
  String filename = "caltas"+loadsam+".txt";
 // println(filename);
  String loadfakein[]=loadStrings(filename);
  String taskdatain[]=split(loadfakein[da1-1], ",");
  for(int i=0;i<31;i++){
  loadfake[i]=loadfakein[i];
  
  //println(loadfake);
  //println(taskdatain);
  }
  for (int i= 0; i<taskdatain.length; i++) {    
    taskdata[i]=taskdatain[i];
    //println(taskdata[i]);
  }
}


void savcaltas1() {
  String savesum = str(ye1)+str(mo1); 
  for (int i = 0; i<taskdata.length; i++) {
    if (i==0) {
      savefake=schtas[1];
      //println(savefake);
    } else {
      savefake+=","+schtas[1];
     // println(savefake);
    }
   // println(savefake);   
  }    
  loadfake[daysdata-1]=savefake;
  saveStrings("caltas"+savesum+".txt", loadfake);
}

String []an={"apple", "b", "c", "d", "e"};
//String []cn = new String [15] ;
String []schtas={"VEP", "解析学", "線形代数", "数学総合演習", "コミュ", 
  "リテラシ", "芸術論", "余暇と健康", "情報機器概論", 
  "ロボット", "情報表現入門","なし"};
int cx = -1;
int concal, concalA;
int seletasx=360;
int seletasychA=60;
int seletasychB=35;
int seletaswidth=150;
int seletasheight=30;
int seletastxtsize=25;

int seletagx=60;
int seletagychA=20;
int seletagychB=35;
int seletagwidthA=60;
int seletagwidthB=120;
int seletagheight=25;
int seletagtxtsize=25;


void m1() {
  for (int i=0; i<15; i++) {
    if (bt(str(i+1), seletagx, seletagychA+seletagychB*i, seletagwidthA, seletagheight, 20, 255, 255, 255, 0, 0, 0))
    {
      concal=i;
    }
  }
  for (int i=0; i<schtas.length; i++) {
    if ( (bt(schtas[i], seletasx, seletasychA+seletasychB*i, seletaswidth, seletasheight, seletastxtsize, 255, 255, 255, 0, 0, 0))) {
      concalA=i;
    }
  } 
  println(true, concal, concalA);
  if (concalA!=100) {
    if (concal!=100) {
      println(true, concal, concalA);
      cx+=1;
      savcaltas();
    }
  }

  loacaltas(ye1,mo1,daysdata);
}


//String []ana=new String[400];
void loacaltas(int yea,int moa,int daa) {
 // println(yea, moa, daa);
  String loadsam = str(yea)+str(moa);
  //println(loadsam);
  String filename = "caltas"+loadsam+".txt";
  // println(filename);
  String loadfakein[]=loadStrings(filename);
  //println(moa);
  String taskdatain[]=split(loadfakein[daa-1], ",");
  for (int i=0; i<31; i++) {
    loadfake[i]=loadfakein[i];

    //println(loadfake);
    //println(taskdatain);
  }
  for (int i= 0; i<taskdatain.length; i++) {    
    taskdata[i]=taskdatain[i];
    //println(taskdata[i], "sss");
  }

}



void savcaltas() {
  if (concalA!=100) {
    // println(concal, taskdata[concal], schtas[concalA], "tttttttt");
    taskdata[concal]=schtas[concalA];
    //println(concal, taskdata[concal], schtas[concalA], "tttttttt");
    String savesum = str(ye1)+str(mo1); 
    for (int i = 0; i<taskdata.length; i++) {
      if (i==0) {
        savefake=taskdata[i];
        //println(savefake);
      } else {
        savefake+=","+taskdata[i];
        // println(savefake);
      }
      // println(savefake);
    }    
    loadfake[daysdata-1]=savefake;
    println(loadfake[daysdata-1]);
    println(savefake);
    println(da1);
    saveStrings("caltas"+savesum+".txt", loadfake);
    loacaltas(ye1,mo1,daysdata);
    concal=100;
    concalA=100;
  }


}

void calendertask() {
  background(0);
  drawrandamcircle();
  selecaltas();
  selecttas1();
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(255);
  text(ye1+"年"+mo1+"月"+daysdata+"日", width-100, 30);
  selecttask();
  if (bt("カレンダーへ", width/2, height-20-40, 140, 30, 20, 255, 255, 255, 0, 0, 0)) {
    swikey=4;
  }
}  

void selecttask() {
  fill(255);
  textSize(24);
  if (concal!=100) {    
    text("第"+str(concal)+"課題を選択中", width/2+40, height-30);
  }
  if (concalA!=100) {
    text(schtas[concalA]+"を選択中", width/2+40, height-30);
  }
}
void selecaltas() {
  for (int i=0; i<15; i++) {
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(seletagtxtsize);
    text(taskdata[i], 170, seletagychA+seletagychB*i);
    if (bt(str(i+1), seletagx, seletagychA+seletagychB*i, seletagwidthA, seletagheight, 20, 255, 255, 255, 0, 0, 0));
  }
}

void selecttas1() {
  for (int i=0; i<schtas.length; i++) {
    if (bt(schtas[i], seletasx, seletasychA+seletasychB*i, seletaswidth, seletasheight, seletastxtsize, 255, 255, 255, 0, 0, 0)) {
    }
  }
}
