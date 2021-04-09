$(document).ready(function(){
	window.addEventListener('message',function(event){
		switch(event.data.action){
			case "openNUI":
				updateGarages();
				$("#actionmenu").fadeIn(100);
			break;

			case "closeNUI":
				$("#actionmenu").fadeOut(100);
			break;
		}
	});

	document.onkeyup = function(data){
		if (data.which == 27){
			$.post("http://vrp_garages/close");
		}
	};
});
/* --------------------------------------------------- */
const updateGarages = () => {
	$.post('http://vrp_garages/myVehicles',JSON.stringify({}),(data) => {
		const nameList = data.vehicles.sort((a,b) => (a.name2 > b.name2) ? 1: -1);
		$('#garagem').html(`
			<div id="buttons">
				<div class="spawn">SPAWN</div>
				<div class="store">GUARDAR</div>
			</div>
			${nameList.map((item) => (`
				<div class="vehicle" data-name="${item.name}">
					<div class="vehicle-text">
						<div class="vehicle-left"><b>Veículo:</b></div>
						<div class="vehicle-right">${item.name2}</div>
					</div>
					<div class="vehicle-text">
						<div class="vehicle-left"><b>Motor:</b></div>
						<div class="vehicle-right">${item.engine}%</div>
					</div>
					<div class="vehicle-text">
						<div class="vehicle-left"><b>Chassi:</b></div>
						<div class="vehicle-right">${item.body}%</div>
					</div>
					<div class="vehicle-text" style="border: 0;">
						<div class="vehicle-left"><b>Gasolina:</b></div>
						<div class="vehicle-right">${item.fuel}%</div>
					</div>
				</div>
			`)).join('')}
		`);
	});
}
/* --------------------------------------------------- */
$(document).on('click','.vehicle',function(){
	let $el = $(this);
	let isActive = $el.hasClass('active');
	$('.vehicle').removeClass('active');
	if(!isActive) $el.addClass('active');
});
/* --------------------------------------------------- */
$(document).on('click','.spawn',debounce(function(){
	let $el = $('.vehicle.active').attr('data-name');
	if($el){
		$.post('http://vrp_garages/spawnVehicles',JSON.stringify({
			name: $el
		}));
	}
}));
/* --------------------------------------------------- */
$(document).on('click','.store',debounce(function(){
	$.post('http://vrp_garages/deleteVehicles');
}));
/* ----------DEBOUNCE---------- */
function debounce(func,immediate){
	var timeout
	return function(){
		var context = this,args = arguments
		var later = function(){
			timeout = null
			if (!immediate) func.apply(context,args)
		}
		var callNow = immediate && !timeout
		clearTimeout(timeout)
		timeout = setTimeout(later,500)
		if (callNow) func.apply(context,args)
	}
}