//中星の粒を作るクラス
class ParticlesMid extends Particles {       //Partilces from the explosion

  ParticlesMid(Point _center, float _dia) {
    super(_center, _dia);
  }

  void display() {

    noStroke();
    fill(random(50, 300), random(0, 100), random(0, 100)); //draw関数の中で、色、明度、彩度をランダム変化させ続ける。
    ellipse(center.x, center.y, dia, dia);
  }
}

