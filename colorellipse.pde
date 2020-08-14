
float col = 400;  
float colnoise;
float radius = 200;
float step = 0.002;

void setup() {
  size(600, 600, P3D);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100, 100);
  background(0);
  blendMode(ADD);
  noFill();

  colnoise = random(10);
} 

void draw() {
  if (mousePressed) {
    background(0);
  }
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.002);
  rotateZ(frameCount * 0.003);
  rotateX(frameCount * 0.003);
  rotateX(noise(frameCount * 0.003));

  float s = 0;
  float t = 0;
  float x = 0;
  float y = 0;
  float z = 0;
  beginShape();
  while (s <= 180) {  
    t += 3; 
    s += 1;
    float radianS = radians(s);
    float radianT = radians(t);

    x = radius * cos(radianS) * sin(radianT);
    y = radius * sin(radianS) * sin(radianT);
    z = radius * cos(radianT);
    stroke(col *  noise(colnoise), 80, col *  noise(colnoise), random(10));
    vertex(x, y, z);
  }
  endShape();
  colnoise += step;
}

void keyPressed() {
  if (keyCode == ENTER){
    saveFrame("####.png");
}
}
