//explosionから星の粒をつくる

abstract class Particles {

  float dia;
  Point center;

  Particles(Point _center, float _dia) {
    center = _center;
    dia = _dia;
    dia = 1;
  }

  //abstract method
  abstract void display();
}

