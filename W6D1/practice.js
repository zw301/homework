document.addEventListener("DOMContentLoaded", function(){
  let c = document.getElementById("myCanvas");
  // myCanvas.style.height = "500px";
  // myCanvas.style.width = "500px";
  //
  // let ctx = c.getContext("2d");
  // ctx.fillStyle = "#FF0000";
  // ctx.fillRect(0,0,10,10);
  //
  // ctx.strokeStyle = "blue";
  // ctx.strokeRect(20.5,20.5,10,10);
  //
  // // ctx.arx(100, 100, 20, 30*Math.PI/180, 30*Math.PI/180, true)
  //
  // ctx.beginPath();
  // ctx.arc(100, 100, 50, 0, 2*Math.PI);
  // // ctx.arc(100,75,50,0*Math.PI,1.5*Math.PI);
  // ctx.stroke();

  if (c.getContext) {
     var ctx = c.getContext('2d');

    ctx.beginPath();
    ctx.arc(75, 75, 50, 0, Math.PI * 2, true); // Outer circle
    ctx.moveTo(110, 75);
    ctx.arc(75, 75, 35, 0, Math.PI, false);  // Mouth (clockwise)
    ctx.moveTo(65, 65);
    ctx.arc(60, 65, 5, 0, Math.PI * 2, true);  // Left eye
    ctx.moveTo(95, 65);
    ctx.arc(90, 65, 5, 0, Math.PI * 2, true);  // Right eye
    ctx.stroke();
  }
});
