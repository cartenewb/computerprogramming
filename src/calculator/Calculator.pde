// Carter Newberg | Nov 2022 | Calc Project
Button[] numButtons = new Button [10];
Button[] opButtons = new Button [14];
String dVal = "0.0";
boolean left = true;
float l, r, result;
char op = ' ';

void setup() {
  size(440, 520);
  numButtons[0] = new Button(125, 390, 60, 60, '0');
  numButtons[1] = new Button(50, 310, 60, 60, '1');
  numButtons[2] = new Button(125, 310, 60, 60, '2');
  numButtons[3] = new Button(200, 310, 60, 60, '3');
  numButtons[4] = new Button(50, 235, 60, 60, '4');
  numButtons[5] = new Button(125, 235, 60, 60, '5');
  numButtons[6] = new Button(200, 235, 60, 60, '6');
  numButtons[7] = new Button(50, 160, 60, 60, '7');
  numButtons[8] = new Button(125, 160, 60, 60, '8');
  numButtons[9] = new Button(200, 160, 60, 60, '9');
  opButtons[0] = new Button (360, 430, 60, 140, '=');
  opButtons[1] = new Button (280, 310, 60, 60, '*');
  opButtons[2] = new Button (280, 235, 60, 60, '-');
  opButtons[3] = new Button (280, 160, 60, 60, '+');
  opButtons[4] = new Button (280, 390, 60, 60, '/');
  opButtons[5] = new Button (50, 390, 60, 60, '±');
  opButtons[6] = new Button (200, 390, 60, 60, '.');
  opButtons[7] = new Button (200, 470, 60, 60, 's');
  opButtons[8] = new Button (280, 470, 60, 60, 'm');
  opButtons[9] = new Button (360, 160, 60, 60, 'C');
  opButtons[10] = new Button (360, 235, 60, 60, 'c');
  opButtons[11] = new Button (360, 310, 60, 60, 'v');
  opButtons[12] = new Button(125, 470, 60, 60, 'f');
  opButtons[13] = new Button(50, 470, 60, 60, 't');
}

void draw() {
  background(#E3E3E3);
  for (int i =0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i =0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}
void keyPressed() {
  println("key:" + key);
  println("keyCode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if(keyCode == 46 || keyCode == 110) {
    handleEvent(".",false);
  } else if(keyCode == 50 || keyCode == 98) {
    handleEvent("2",false);
  }
}
void handleEvent(String val, boolean num) {
  if (num == true) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0";
    left = true;
    l = 0;
    r = 0;
    result = 0;
    op = ' ';
  } else if(val.equals(".")){
    if(!dVal.contains(".")) {
      dVal += ".";
    }
  }
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  if (left) {
    l = float(dVal);
  } else {
    r = float(dVal);
  }
  for (int i =0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      dVal = "0.0";
      left = true;
      l = 0.0;
      r = 0.0;
      op = ' ';
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      op = '+';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      op = '-';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '*') {
      op = '*';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '/') {
      op = '/';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      op = 's';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'f') {
      op = 'f';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 't') {
      op = 't';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'v') {
      op = 'v';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'm') {
      op = 'm';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".",false);
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l = l* -1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    }
  }
  println("l:" + l + " r:" + r + " op:" + op + "result:" + result + "left" + left);
}


void updateDisplay() {
  fill(0);
  rectMode(CENTER);
  rect(220, 60, 405, 80);
  fill(255);
  textSize(30);
  textAlign(LEFT);
  text(dVal, 200, 70);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  } else if (op == 's') {
    result = l * l;
  } else if (op == 'f') {
    result = l * l * l * l;
  } else if (op == 't') {
    result = l * l * l;
  } else if (op == 'v') {
    result = l * l * l * l * l;
  } else if (op == 'm') {
    result = l * l * l * l * l * l;
  } else if (op == '±') {
    result = l = -l;
  }
  dVal = str(result);
  l = result;
  left = true;
}
