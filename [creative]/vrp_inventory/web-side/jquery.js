$(document).ready(function(){
  window.addEventListener("message",function(event){
		switch(event.data.action){
			case "showMenu":
				updateMochila();
				$("#body").fadeIn(100);
			break;

			case "hideMenu":
				$("#body").fadeOut(100);
			break;

			case "updateMochila":
				updateMochila();
			break;
		}
	});

	document.onkeyup = function(data){
		if (data.which == 27){
			$.post("http://vrp_inventory/invClose",JSON.stringify({}));
		}
	};
});

const updateDrag = () => {
	$('.populated').draggable({
		helper: 'clone'
	});

	$('.empty').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			$.post("http://vrp_inventory/populateSlot", JSON.stringify({
				item: itemData.key,
				slot: itemData.slot,
				target: target,
				amount: parseInt($(".amount").val())
			}))

			$('.amount').val("")
		}
	});

	$('.populated').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
			const target = $(this).data('slot');

			if (itemData.key === undefined || target === undefined) return;

			$.post("http://vrp_inventory/updateSlot", JSON.stringify({
				item: itemData.key,
				slot: itemData.slot,
				target: target,
				amount: parseInt($(".amount").val())
			}))

			$('.amount').val("")
		}
	});

	$('.use').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };

			if (itemData.key === undefined) return;

			$.post("http://vrp_inventory/useItem",JSON.stringify({
				item: itemData.key,
				slot: itemData.slot,
				amount: parseInt($(".amount").val())
			}))

			$('.amount').val("")
		}
	});

	$('.drop').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };

			if (itemData.key === undefined) return;

			$.post("http://vrp_inventory/dropItem",JSON.stringify({
				item: itemData.key,
				slot: itemData.slot,
				amount: parseInt($(".amount").val())
			}))

			$('.amount').val("")
		}
	});

	$('.submit').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			itemData = { key: ui.draggable.data('item-key') };

			if (itemData.key === undefined) return;

			$.post("http://vrp_inventory/sendItem",JSON.stringify({
				item: itemData.key,
				amount: parseInt($(".amount").val())
			}))

			$('.amount').val("")
		}
	});
}

const updateMochila = () => {
	const mySlots = 50;

	$.post("http://vrp_inventory/requestMochila",JSON.stringify({}),(data) => {
		$("#myInfos").html(`
			<b>${data.infos[0]} <i>#${data.infos[1]}</i></b>
			<div id="myInfosContent">
				<span><s>Nº:</s> ${data.infos[4]}</span>
				<span><s>RG:</s> ${data.infos[5]}</span>
				<span><s>BANCO:</s> $${formatarNumero(data.infos[2])}</span>
				<span><s>GEMAS:</s> ${formatarNumero(data.infos[3])}</span>
				<span><s>PESO:</s> ${(data.peso).toFixed(2)} / ${(data.maxpeso).toFixed(2)}</span>
			</div>
		`);

		$("#invweight").html(`
			<div id="myWeight">
				<div id="myWeightContent" style="width: ${data.peso/data.maxpeso*100}%"></div>
			</div>
		`);

		$("#invleft").html("");
		for (let x=1; x <= mySlots; x++){
			const slot = x.toString();

			if (data.inventario[slot] !== undefined) {
				const v = data.inventario[slot];
				const item = `<div class="item populated" style="background-image: url('images/${v.index}.png');" data-item-key="${v.key}" data-name-key="${v.name}" data-slot="${slot}">
					<div id="peso">${(v.peso*v.amount).toFixed(2)}</div>
					<div id="quantity">${formatarNumero(v.amount)}x</div>
					<div id="itemname">${v.name}</div>

					${v.durability !== undefined ? `<div id="durability"><div id="durability2" style="width: ${v.durability*10}%"></div></div>`:`<div id="nonebility"></div>`}
				</div>`;

				document.getElementById("invleft").innerHTML = `${document.getElementById("invleft").innerHTML} ${item}`;
			} else {
				const item = `<div class="item empty" data-slot="${slot}"></div>`;

				document.getElementById("invleft").innerHTML = `${document.getElementById("invleft").innerHTML} ${item}`;
			}
		}
		updateDrag();
	});
}

const formatarNumero = (n) => {
	var n = n.toString();
	var r = '';
	var x = 0;

	for (var i = n.length; i > 0; i--) {
		r += n.substr(i - 1, 1) + (x == 2 && i != 1 ? '.' : '');
		x = x == 2 ? 0 : x + 1;
	}

	return r.split('').reverse().join('');
}

function somenteNumeros(e){
	var charCode = e.charCode ? e.charCode : e.keyCode;
	if (charCode != 8 && charCode != 9){
		var max = 9;
		var num = $(".amount").val();

		if ((charCode < 48 || charCode > 57)||(num.length >= max)){
			return false;
		}
	}
}