//内星の粒を作るクラス

class ParticlesIn extends Particles {       //Partilces from the explosion

  private color c;

  ParticlesIn(Point _center, color _c, float _dia) {
    super(_center, _dia);
    dia = 0.5;
    c = _c;
  }

  void display() {
    fill(c); //弾道の色と同じにする。
    noStroke();
    ellipse(center.x, center.y, dia, dia);
  }
}

