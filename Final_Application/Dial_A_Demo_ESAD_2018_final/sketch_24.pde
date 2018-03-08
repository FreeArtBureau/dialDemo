/**
 * Sketch : Mandy Elby
 */

class SceneTwentyFour extends Scene {

    float trackSize = TAU/9.0; // change to PI for neat effect
    float[] startMarkers, startMarkers2;
    //float[] ;
    float test = 2;
    float startMarkerSpeed;


    void setup() {
      student = "Mandy Elbé";
      title = "aMaze";
      sketchCode = "sketch_24.pde";
      code = loadPde(sketchCode);
      startMarkers = new float[]{0, TAU/3, TAU/3*2};
      startMarkers2 = new float[]{0, TAU/3, TAU/3*2};
    }

    void draw() {
      pushMatrix();
      pushStyle();
      background(0, 0, 33);
      translate(screenSizeW/2, screenSizeH/2);
      rotate(frameCount/2000.0f);

  // RINGS
  for (int ringIdx = 0; ringIdx < 10; ringIdx++) {
    int count = 6 + (ringIdx * 6);

    startMarkerSpeed = TAU / (60.0 * 5);

    // RING
    for (float c = 0; c < count; c++) {
      float i = ( c / count) * TAU;

      pushMatrix();

      if (ringIdx % 2 == 0) {
        rotate(-test);
      }

      rotate(i);
      translate(0, 20 + ringIdx * 24);

      // flippy flip!
      if (!mousePressed) {
        rotate(HALF_PI);
      }

      // I got super lazy here  :/
      int f = 0;
      for (int t = 0; t < 3; t++) {
        boolean fo = rotateIfInTrack(ringIdx % 2 == 0 ? startMarkers2[t] + ringIdx/5.0f : startMarkers[t] + ringIdx/5.0f, i);
        if (fo) {
          f++;
          //rect(1, 0, 2, 5);
        }
      }
      if (f == 0) {
        fill(255);
        rect(3, 0, 22, 6);
      }

      popMatrix();
    }
  }
  moveStartMarkers();

      popStyle();
      popMatrix();
    }

    void moveStartMarkers() {
  float reverseSpeed = 1/2.f;

  for (int i = 0; i < 3; i++) {
    startMarkers[i] = (startMarkers[i] + startMarkerSpeed) % TAU;
    startMarkers2[i] = (startMarkers2[i] + startMarkerSpeed * (1+reverseSpeed)) % TAU;
  }
  test += startMarkerSpeed * reverseSpeed;
}

boolean rotateIfInTrack(float m, float i) {
  float dist = 0;
  float mm = m % TAU;

  // inverse, since we want '0' to start near the edge of spinning
  if (i > mm && i < (mm + trackSize)) {
    dist = 1 - (i - mm)/(trackSize);
  } else if (i < mm - TAU + trackSize) {
    dist = (i + TAU - mm)/trackSize;
  }

  // 0 .. PI/2
  float r = (dist/.5f) * HALF_PI;

  if (r == 0) {
    return false;
  }

  float cappedRot = min(1, 3 * sin(r));
  fill( 64, 255 * cappedRot, 255);
  rotate(cappedRot * HALF_PI);

  return true;
}
}