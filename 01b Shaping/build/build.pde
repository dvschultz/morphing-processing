float u,v,w = 0;
float x,y,z = 0;
float uMin,uMax,vMin,vMax,wMin,wMax;
float iter = 100;
float scalar = 30;
void setup() {
  size(600,600,P3D);
  background(0);
  strokeWeight(1);
  stroke(255);
}

void draw() {
	u = 0;
	v = 0;
	uMax = 2*PI;
	vMax = PI;

	background(0);
	translate(width/2,height/2,0);

	

	pushMatrix();
	// scale(scalar,scalar,scalar);
	rotateX(frameCount*PI/200);
	rotateZ(frameCount*PI/200);
	
		// z = v*scale;
	v = 0;
	for(u = 0; u <= uMax; u+=(uMax/iter))  {
	    x = cos(u)*scalar;
	    y = sin(u)*scalar;
	    z = u*scalar;
	    point(x,y,z);
	}
	popMatrix();
}