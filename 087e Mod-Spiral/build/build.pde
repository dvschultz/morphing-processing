float u,v,w = 0;
float x,y,z = 0;
float uMin,uMax,vMin,vMax,wMin,wMax,uStart,vStart;
float iter = 125;
float scalar = 30;
void setup() {
  size(400,800,P3D);
  background(0);
  strokeWeight(1);
  stroke(255);
  uMin = 0; //try -4*PI
	vMin = 0;
	uMax = PI; //try 4*PI
	vMax = 2*PI;
  uStart = uMax;
  vStart = vMin;
}

void draw() {
	u = 0;
	v = 0;
	

	background(0);
	translate(width/2,height/2,0);

	pushMatrix();

	rotateX(frameCount*PI/300);
	//rotateX(PI/2);
	rotateY(PI/2);
	// scale( (frameCount/1000.0) + 1);
	// rotateZ(frameCount*PI/100);

	//try rotateX(PI/2);
	for(u = uStart; u <= uMin+uMax; u+=((uMax-uMin)/iter))  {
	//for(u = uMin; u <= uMin+uMax; u+=((uMax-uMin)/iter))  {
	    //for(v = vMin; v <= vMin+vMax; v+=((vMax-vMin)/iter)) {
	    for(v = vStart; v <= vMin+vMax; v+=((vMax-vMin)/iter)) {
	    	x = ( u * sin(v) * cos(4*u) ) * scalar;
	    	y = ( u * sin(v) * sin(4*u) ) * scalar;
	    	//z =  u * cos(u+v) * scalar;
	    	// z =  u * cos(u) * scalar;
	    	z =  v * cos(u) * scalar;
	    	//z = u* cos(v)*scalar;
	    	point(x,y,z);
	    }
	}
	popMatrix();
	surfaceItems();
	vStart+=(PI/480);
	uStart-=(PI/480);
	if (vStart >= vMax || vStart <= vMin) {
		vStart = vMax;
	}
	if (uStart >= uMax || uStart <= uMin) {
		uStart = uMin;
	}
}

void surfaceItems() {
    surface.setTitle("FPS = " + (int)frameRate );
}