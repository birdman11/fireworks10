//花火の星を展開する
class Explosion {     

  private ArrayList<Particles> particle;
  private float xa, ya;
  private Point position;
  private float dis, fin;
  private color c;

  Explosion(Point _position, color _c) {
    particle = new ArrayList<Particles>();
    position = _position;
    c = _c;
    dis = 0;
    fin = random(15, 130);//展開の終わりの距離
  }
  //particleによる星の爆発（展開）の描画。外縁、外星、中星、内星が生成される。
  void explode() {
    for (int a = 0; a < 360; a += 5) {//360度の範囲で、72個の粒を生成
      xa = sin(radians(a))*dis; //x座標上の星の移動距離
      ya = cos(radians(a))*dis; //y座標上の星の移動距離
      particle.add(new ParticlesOut(new Point(position.x+xa, position.y+ya), c, 4)); //外縁
      particle.add(new ParticlesMid(new Point(position.x+xa/1.1, position.y+ya/1.1), 4));//外星
      particle.add(new ParticlesMid(new Point(position.x+xa/2, position.y+ya/2), 4)); //中星
      particle.add(new ParticlesIn(new Point(position.x+xa/5, position.y+ya/5), c, 4));//内星
    }

    //ParticleをArrayListから取って、描画する
    for (int p = 0; p < particle.size (); p ++) {
      Particles part = particle.get(p);
      part.display(); //粒の描画
      particle.remove(p);
    }
    dis++;
  }

  //爆発描画の終了判定
  boolean over() {
    return dis > fin;
  }
}

