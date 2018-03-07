/**
 * Sketch : Margot
 *
 */

class SceneTwo extends Scene {

  void setup() {
    student = "MW";
    title = "3D Fields";
    artist = " ";
    sketchCode = "sketch_02.pde";
    code = loadPde(sketchCode);
}

/////////////////////////// DRAW ////////////////////////////

void draw() {
  background(0,0,33);
  noiseDetail(2, 0.73);
  int numX = 125;
  int numY = 70;
  int pnts = 6;

  //Center our grid
  float offpntsX = -numX * pnts / 2;
  float offpntsY = -numY * pnts / 2;
  pushMatrix();
  translate(sceneWidth/2, (numY+sceneHeight/2.3));

  float snx = sin(frameCount * 0.0007) * 6;
  float sny = sin(frameCount * 0.0003) * 6;


  stroke(255);
  strokeWeight(1.7);
  for (int j=0; j<numY-1; j++) {
    for (int i=0; i<numX-1; i++) {

      //Calculate our x & y coordinates for our points
      float px = offpntsX + i * pnts;
      float py = offpntsY + j * pnts;

      float pz = noise(px * 0.004 + snx, py * 0.004 + sny) * 300;
      point(px, py, pz);

    }
  }
  popMatrix();
}

}
