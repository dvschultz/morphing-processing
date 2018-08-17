float u,v,w = 0;
float x,y,z = 0;
float uMin,uMax,vMin,vMax,wMin,wMax;
float iter = 120;
float scalar = 75;
void setup() {
  size(600,600,P3D);
  background(0);
  strokeWeight(1);
  stroke(255);
}

void draw() {
	u = 0;
	v = 0;
	uMin = 0;
	uMax = (2*PI);
	vMin = 0;
	vMax = PI;

	background(0);
	translate(0,height/2,0);

	pushMatrix();
	// scale(scalar);


	// rotateX(frameCount*PI/300);
	// rotateY(frameCount*PI/200);
	// rotateZ(frameCount*PI/100);

	//try rotateX(PI/2);
	
	v = 0;
	for(u = uMin; u <= uMax; u+=((uMax-uMin)/iter))  {
	    //for(v = vMin; v <= vMax; v+=((vMax-vMin)/iter)) {
	    	x = u*scalar;
	    	y = sin(u)*scalar;
	    	point(x,y,0);

	    	point(x/2,y,0);

	    	y = (sin(u)/2)*scalar;
	    	point(x,y,0);

	    	point(x/2,y,0);
	    //}
	}
	popMatrix();
}