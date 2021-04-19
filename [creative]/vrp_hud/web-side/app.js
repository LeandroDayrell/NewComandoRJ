/* VARIABLES */
var vehicleResult = false;
/* EVENTLISTENER */
$(document).ready(function(){
	window.addEventListener("message",function(event){

		if (event.data.hud !== undefined){
			if (event.data.hud == true){
				$("#hudDisplay").fadeIn(1000);
				$("#vehicleDisplay").fadeIn(1000);
			} else {
				$("#hudDisplay").fadeOut(1000);
				$("#vehicleDisplay").fadeOut(1000);
			}
			return
		}

		if (event.data.movie !== undefined){
			if (event.data.movie == true){
				$("#movieTop").fadeIn(1000);
				$("#movieBottom").fadeIn(1000);
			} else {
				$("#movieTop").fadeOut(1000);
				$("#movieBottom").fadeOut(1000);
			}
			return
		}

		if (event.data.hood !== undefined){
			if (event.data.hood == true){
				$("#hoodDisplay").fadeIn(1000);
			} else {
				$("#hoodDisplay").fadeOut(1000);
			}
		}

		if (event.data.talking == true) {
			if (event.data.voice == 1){
				$("#voice01").css("background","rgba(255,255,0,0)");
				$("#voice02").css("background","rgba(255,255,0,0)");
				$("#voice03").css("background","rgba(255,255,0,0.5)");
			} else if (event.data.voice == 2){
				$("#voice01").css("background","rgba(255,255,0,0)");
				$("#voice02").css("background","rgba(255,255,0,0.5)");
				$("#voice03").css("background","rgba(255,255,0,0.5)");
			} else if (event.data.voice == 3){
				$("#voice01").css("background","rgba(255,255,0,0.5)");
				$("#voice02").css("background","rgba(255,255,0,0.5)");
				$("#voice03").css("background","rgba(255,255,0,0.5)");
			}
		} else {
			if (event.data.voice == 1) {
				$("#voice01").css("background","rgba(255,255,255,0)");
				$("#voice02").css("background","rgba(255,255,255,0)");
				$("#voice03").css("background","rgba(255,255,255,0.5)");
			} else if (event.data.voice == 2){
				$("#voice01").css("background","rgba(255,255,255,0)");
				$("#voice02").css("background","rgba(255,255,255,0.5)");
				$("#voice03").css("background","rgba(255,255,255,0.5)");
			} else if (event.data.voice == 3){
				$("#voice01").css("background","rgba(255,255,255,0.5)");
				$("#voice02").css("background","rgba(255,255,255,0.5)");
				$("#voice03").css("background","rgba(255,255,255,0.5)");
			}
		}

		if (event.data.health <= 1){
			$(".healthDisplay").css("width","0");
		} else {
			$(".healthDisplay").css("width",event.data.health+"%");
		}

		if (event.data.armour == 0){
			$(".armourBackground").fadeOut(1000);
		} else {
			$(".armourBackground").fadeIn(1000);
			$(".armourDisplay").css("width",event.data.armour+"%");
		}

		$(".thirstDisplay").css("height",event.data.thirst+"%");
		$(".hungerDisplay").css("height",event.data.hunger+"%");
		$(".stressDisplay").css("height",event.data.stress+"%");

		if (event.data.hours <= 9){
			event.data.hours = "0"+event.data.hours
		}

		if (event.data.minutes <= 9){
			event.data.minutes = "0"+event.data.minutes
		}
		$(".clockDisplay").html(event.data.hours+":"+event.data.minutes);

		if (event.data.vehicle !== undefined){
			if (vehicleResult !== event.data.vehicle){
				if (event.data.vehicle == true){
					$("#vehicleDisplay").fadeIn(1000);
				} else {
					$("#vehicleDisplay").fadeOut(1000);
				}
				vehicleResult = event.data.vehicle;
			}

			if (event.data.vehicle == true){
				if (event.data.seatbelt){
					$("#belt").fadeOut(500);
				} else {
					$("#belt").fadeIn(500);
				}

				$("#vehicleGas").html("<s>GAS</s> "+ parseInt(event.data.fuel));
				$("#vehicleSpeed").html("<s>KM/H</s> "+ parseInt(event.data.speed));
			}
		}

		$(".streetDisplay").html(event.data.radio + event.data.street + " <s> : </s> " + event.data.direction);
	});
});