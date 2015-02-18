/*
Map {
  //background-color: #b8dee6;
  background-color: #000;
}

#countries {
  ::outline {
    line-color: #85c5d3;
    line-width: 2;
    line-join: round;
  }
  polygon-fill: #fff;
}
*/

#crime {
  //marker-width:5; // NOTICE: COMMENT OUT MARKER WIDTH
  //marker-fill:#f45; // NOTICE: COMMENT OUT FILL
  marker-line-color:#813;
  marker-allow-overlap:true;
  marker-ignore-placement:false;
  // added styles
  marker-opacity:0.35;
  marker-line-opacity:0;
  marker-comp-op:lighten;
  // Changing marker widths by zoom level
  [zoom <= 11]{
  	marker-width:2.5;
  }
  [zoom > 11][zoom <= 13]{
  	marker-width:2.5 + 2;
  }
  [zoom = 14]{
  	marker-width: 2.5 + 4;
  }
  [zoom >= 15]{
  	marker-width: 2.5 + 6;
  }
  // styling data color by crime
  ['TYPE' = 'Mischief Under $5000']{
	marker-fill:lighten(#0000FF, 10%);
  }
  ['TYPE' = 'Mischief Over $5000']{
	marker-fill: #0000FF;
  }
  ['TYPE' = 'Theft From Auto Under $5000']{
	marker-fill: lighten(#FF0000, 10%);
  }
  ['TYPE' = 'Theft from auto over $5000']{
	marker-fill: #FF0000;
  }
  ['TYPE' = 'Theft Of Auto Under $5000']{
	marker-fill: darken(#FF0000, 10%);
  }
  ['TYPE' = 'Theft Of Auto Over $5000']{
	marker-fill: darken(#FF0000, 20%);
  }
  ['TYPE' = 'Commercial Break and Enter']{
	marker-fill: #00FF00;
  }
}
