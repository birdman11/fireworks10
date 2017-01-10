//外縁を作る粒のクラス
class ParticlesOut extends Particles {      

  private color c;

  ParticlesOut(Point _center, color _c, float _dia) {
    super(_center, _dia);
    c = _c;
    dia = 0.5;
  }

  void display() {
    fill(c);//弾道の色と同じにする。
    noStroke();
    ellipse(center.x, center.y, dia, dia);
  }
}

