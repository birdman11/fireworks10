//玉の弾道

class Rocket {     //the launch sequence

  private color c;
  private Point position;
  private float dia;
  private float endy;

  Rocket() {
    dia = 1.5;
    position = new Point(random(150, (width-150)), height);
    endy = random(150, height-150);
    c = color(random(0, 360), 80, 90);
  }

  void draw() {
    noStroke();
    fill(c);
    ellipse(position.x, position.y, dia, dia);
    position.y -= 3;
  }

  //yがendyより小さい場合の判定
  boolean reached() {
    return position.y < endy;
  }
}

