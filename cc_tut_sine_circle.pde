int diameter = 50;  // circle diameter
int numCircles = 10;  // number of circles
int outerDiameter;

void setup() {
  size(1000, 1000);
  outerDiameter = width/2;
}

void draw() {
  background(0);
  noFill();
  
  fill(255);
  for(int n = 0; n < numCircles; n++) {
    // sin and cos return the sine cosine of a giving angle (or offset)
    // sin() and cos() expect this angle to be between 0..2*PI
    // the radians() function allows us to convert a degree value (0..360) to a
    // corresponding radians value (0..2*PI)    
    float angle = map(n, 0, numCircles-1, -180, 180);
        
    float sinWave = sin(radians(angle + frameCount));
    float cosWave = cos(radians(angle + frameCount));
   
    // remap the sinWave and cosWave values by multiplying them
    // by a giving range
    // by the use of (width/2 - diameter/2) as range value,
    // the circles will use the full canvas size to for their horizontal movement
    // by subtracing -diameter/2 from the width/2, the circles will never
    // exceed the canvas size and will stop right before the borders / edges of the canvas 
    cosWave = map(cosWave, -1, 1, -outerDiameter/2, outerDiameter/2);
    sinWave = map(sinWave, -1, 1, -outerDiameter/2, outerDiameter/2);
    
    float x1 = width/2 + cosWave;
    float y1 = height/2 + sinWave;

    // draw circles at the top 
    fill(255);
    noStroke();
    circle(x1, y1, diameter);
    
    
    // find the closest corner based on the x,y-position of each individual circle
    // 0, 0
    // 0, 1000 (height)
    // 1000 (width), 0
    // 1000 (width), 1000 (height)
    int cornerX = 0;
    int cornerY = 0;
    if (x1 > width/2) {
      cornerX = width;
    }
    if (y1 > height/2) {
      cornerY = height;
    }
    
    
    stroke(255);
    strokeWeight(3);
    line(x1, y1, cornerX, cornerY);
  }
}
