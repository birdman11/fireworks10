//オブジェクト指向基礎プログラミング最終課題
//2016/7/26提出
//日下部眞太郎
//環境情報学部４年
//学籍番号：71243226
//Processing ver 2.2.1で作成

//参考ソースコード
//<http://www.openprocessing.org/sketch/207569>
//"A play of fireworks in a dark city"
//07-24-2015

//参考資料
//画家　山下清の花火の切絵
//<http://www.ddart.co.jp/nagaokanohanabi.html>

int timer; //アニメーション時間
ArrayList<Explosion> explosion; //爆発
ArrayList<Rocket> rocket; //弾道

//初期値
void setup() {
  background(0);
  size(1000, 700);
  frameRate(30);
  colorMode(HSB, 360, 100, 100);
  explosion = new ArrayList<Explosion>();
  rocket = new ArrayList<Rocket>();
  smooth();
  timer = 0;
}

//１５秒間だけアニメーションを描画する。
//１５秒以内は、全てのアニメーションを描画するが、
//それ以降は新しい花火を打ち上げることをやめる。
void draw() {
  if (timer<15*30) {
    setRocket();
    launch();
    explode();
  } else {
    launch();
    explode();
  }
  timer++;
}

//フレームカウント４０毎にrocketをセットする。
void setRocket() {      
  if ((frameCount % 40) == 0) {
    rocket.add(new Rocket());
  }
}


//弾道を発射させる。弾道が、一定の高さに到達したら玉を爆発させる。
void launch() {        
  for (int r = 0; r < rocket.size (); r++) {
    Rocket roc = rocket.get(r);
    roc.draw();  //弾道の描画
    if (roc.reached()) {  
      explosion.add(new Explosion(roc.position, roc.c)); //explosionを生成
      rocket.remove(r);
    }
  }
}


//一定の高さに到達したら、玉を爆発させて花火の星を展開させる。もしoverの条件を満たしたら星の展開をとめる。
void explode() {    
  for (int e = 0; e < explosion.size (); e++) {
    Explosion ex = explosion.get(e);
    ex.explode();
    if (ex.over()) {
      ex.dis--;
    }
  }
}

