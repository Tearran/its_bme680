#!/bin/bash
# This software is ...
# Copyright (c) 2022 Joseph Turner (aka Tearran) & contributors

main="$(dirname "${BASH_SOURCE[0]}")"
dir=/run/user/1000/its/
echo $main
cd "$main"


if [ ! -d "$dir" ]; then
  mkdir -p "$dir"
fi
#  open host to network not recomended beond develoment
myip="http://$(hostname -I | sed 's/^[ \t]*//;s/[ \t]*$//'):8000"

# Bind to localhost
#myip="http://localhost:8000/bme680.json"
cat <<EOF > /run/user/1000/its/index.html
<!DOCTYPE html>
<html>
<head>
	<title>JSON Data Display</title>
	<style>

   body {
	   background: #000;
	   stroke: #ffa50000;
   }
  
   svg {
	   stroke-dasharray: 1000;
	   stroke-dashoffset: 100;
	   animation: dash 1s linear forwards;
	   stroke-linecap: round;
	   fill:rgba(255,130,0,1);
   }
   
   .data {
	   dominant-baseline: hanging;
	   fill: #ffa500;
	   stroke-linecap: round;
   }
      
   text {
	   opacity: 1;
	   font-size: large;
       fill: #ffff00;
       stoke:rgba(255,130,0,0);
   }
  
  </style>
</head>
<body>

<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
	   <g id="frameBanner">
		   <path id="path4978" d="m6.0391 5.00002c-.054 64.7496-1.0391 37.5309-1.0391 102.5h.01c.4425 25.1559 22.0985 42.5 47.5058 42.5h97.4844v-25h-39.9453c-5.5707 0-10.0548-5.39003-10.0547-12.084v-7.91602h-.014c-.8176-64.7506 1.0528-35.2077 1.0528-100zm148.961 120v25h789.986v-25zm991.248-.11353v25l128.75-.00049v-25zm-1093.73 30.1135c-25.4072 0-47.0633 17.3441-47.5058 42.5h-.01v102.5h94.9864v-100h.014v-7.91602c0-6.69403 4.4841-12.084 10.0547-12.084h39.9453v-25h-50zm102.484 0v25h789.986v-25zm991.248-.11353v25l128.75-.00049v-25z">
			   <desc id="desc4974">Banner and main body</desc>
			   <title id="title4976">Frame with date banner</title>
		   </path>
		   <text id="title01" class="dataTitle" x="950" y="140" font-size="2em">BMPE680</text>
	   </g>
<g transform="translate(50 25)">
    
  <text x="5%" y="5%">Temperature </text>
  <text x="20%" y="5%">Pressure   </text>
  <text x="35%" y="5%">Humidity   </text>
  <text x="50%" y="5%">Gas Resist </text>
  <text x="75%" y="5%">Stable</text>
  <text x="85%" y="5%">Index  </text>
  
  <g id="bme680" x="5%" y="15%">array</g>
  <g id="bmp280" x="5%" y="20%">array</g>
  
</g>
</svg>
<script>
  function updateData() {
    // Fetch data from first endpoint
    fetch('$myip/bme680.json')
      .then(response => response.json())
      .then(data => {
        const g1 = document.getElementById('bme680');
        g1.innerHTML = '';
        const y1 = 15;
        g1.appendChild(createText(data.temperature, 5, y1));
        g1.appendChild(createText(data.pressure, 20, y1));
        g1.appendChild(createText(data.humidity, 35, y1));
        g1.appendChild(createText(data.gas_resistance, 50, y1));
        g1.appendChild(createText(data.heat_stable ? 'Yes' : 'No', 75, y1));
        g1.appendChild(createText(data.gas_index, 85, y1));
      })
      .catch(error => console.log(error));
    
    // Fetch data from second endpoint
    fetch('$myip/bme680.json')
      .then(response => response.json())
      .then(data => {
        const g2 = document.getElementById('bmp280');
        g2.innerHTML = '';
        const y2 = 25;
        g2.appendChild(createText(data.temperature, 5, y2));
        g2.appendChild(createText(data.pressure, 20, y2));
      })
      .catch(error => console.log(error));
  }

  function createText(text, x, y) {
    const t = document.createElementNS('http://www.w3.org/2000/svg', 'text');
    t.textContent = text;
    t.setAttribute('x', x + '%');
    t.setAttribute('y', y + '%');
    return t;
  }

  setInterval(updateData, 1000);
</script>



</body>

</html>

EOF

    python3 "$main/its_bme680.py" &
    echo "$main/its_bme680.py running"
    cd "$dir" 
    python3 -m http.server 8000
    
