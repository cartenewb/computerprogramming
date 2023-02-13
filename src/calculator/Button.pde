class Button {
  // Member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;

  // Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(#2372FA);
    c2 = color(#1494E3);
    on = false;
  }

  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    noStroke();
    fill(0);
    textSize(24);
    textAlign(CENTER);
    if(val == 'C') {
      text("Clear",x,y);
    } else if (val == 's') {
      text("x²",x,y);
    } else if (val == 't') {
      text("x³",x,y);
    } else if (val == 'f') {
      text("x⁴",x,y);
    } else if (val == 'v') {
      text("x⁵",x,y);
    } else if (val == 'm') {
      text("x⁶",x,y);
    }else{
          text(val, x, y);
    }
  }

  void hover(int mx, int my) {
    on = (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2);
  }
}
