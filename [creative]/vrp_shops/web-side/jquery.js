var selectShop = "selectShop";
var selectType = "Buy";
/* --------------------------------------------------- */
$(document).ready(function(){
	window.addEventListener("message",function(event){
		switch(event.data.action){
			case "showNUI":
				selectShop = event.data.name;
				selectType = event.data.type;
				$("#body").fadeIn(100);
				requestShop();
			break;

			case "hideNUI":
				$("#body").fadeOut(100);
			break;

			case "requestShop":
				requestShop();
			break;
		}
	});

	document.onkeyup = function(data){
		if (data.which == 27){
			$.post("http://vrp_shops/close");
		}
	};
});
/* --------------------------------------------------- */
const updateDrag = () => {
	$('.populated').draggable({
		helper: 'clone'
	});

	$('.empty').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			const origin = ui.draggable.parent()[0].id;
			if (origin === undefined) return;

			const tInv = $(this).parent()[0].id;

			if ( tInv === "invleft" ) {
				if ( origin === "invleft" ) {
					itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
					const target = $(this).data('slot');

					if (itemData.key === undefined || target === undefined) return;

					$.post("http://vrp_shops/populateSlot",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				} else if ( origin === "invright" ) {
					itemData = { key: ui.draggable.data('item-key') };
					const target = $(this).data('slot');

					if (itemData.key === undefined || target === undefined) return;

					$.post("http://vrp_shops/functionShops",JSON.stringify({
						shop: selectShop,
						index: itemData.key,
						slot: target,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				}
			} else if ( tInv === "invright" ) {
				if ( origin === "invleft" && selectType === "Sell" ) {
					itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') }

					if (itemData.key === undefined) return;

					$.post("http://vrp_shops/functionShops",JSON.stringify({
						shop: selectShop,
						index: itemData.key,
						slot: itemData.slot,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				}
			}
		}
	});

	$('.populated').droppable({
		hoverClass: 'hoverControl',
		drop: function(event,ui){
			const origin = ui.draggable.parent()[0].id;
			if (origin === undefined) return;

			const tInv = $(this).parent()[0].id;

			if ( tInv === "invleft" ) {
				if ( origin === "invleft" ) {
					itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') };
					const target = $(this).data('slot');

					if (itemData.key === undefined || target === undefined) return;

					$.post("http://vrp_shops/updateSlot",JSON.stringify({
						item: itemData.key,
						slot: itemData.slot,
						target: target,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				} else if (origin === "invright") {
					itemData = { key: ui.draggable.data('item-key') };
					const target = $(this).data('slot');

					if (itemData.key === undefined || target === undefined || itemData.key !== $(this).data('item-key') ) return;

					$.post("http://vrp_shops/functionShops",JSON.stringify({
						shop: selectShop,
						index: itemData.key,
						slot: target,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				}
			} else if ( tInv === "invright" ) {
				if ( origin === "invleft" && selectType === "Sell" ) {
					itemData = { key: ui.draggable.data('item-key'), slot: ui.draggable.data('slot') }

					if (itemData.key === undefined) return;

					$.post("http://vrp_shops/functionShops",JSON.stringify({
						shop: selectShop,
						index: itemData.key,
						slot: itemData.slot,
						amount: parseInt($(".amount").val())
					}))

					$('.amount').val("")
				}
			}
		}
	});
}
/* --------------------------------------------------- */
const formatarNumero = (n) => {
	var n = n.toString();
	var r = '';
	var x = 0;

	for (var i = n.length; i > 0; i--){
		r += n.substr(i - 1, 1) + (x == 2 && i != 1 ? '.' : '');
		x = x == 2 ? 0 : x + 1;
	}

	return r.split('').reverse().join('');
}
/* --------------------------------------------------- */
const requestShop = () => {
	const mySlots = 50;
	const inSlots = 50;

	$.post("http://vrp_shops/requestShop",JSON.stringify({ shop: selectShop }),(data) => {
		$("#myInfos").html(`
			<b>${data.infos[0]} <i>#${data.infos[1]}</i></b>
			<div id="myInfosContent">
				<span><s>Nº:</s> ${data.infos[4]}</span>
				<span><s>RG:</s> ${data.infos[5]}</span>
				<span><s>BANCO:</s> $${formatarNumero(data.infos[2])}</span>
				<span><s>GEMAS:</s> ${formatarNumero(data.infos[3])}</span>
				<span><s>PESO:</s> ${(data.weight).toFixed(2)} / ${(data.maxweight).toFixed(2)}</span>
			</div>
		`);

		$("#invweight").html(`
			<div id="myWeight">
				<div id="myWeightContent" style="width: ${parseInt(data.weight/data.maxweight*100)}%"></div>
			</div>
		`);

		const nameList2 = data.inventoryShop.sort((a,b) => (a.name > b.name) ? 1: -1);

		$("#invleft").html("");
		$("#invright").html("");

		for (let x=1; x <= mySlots; x++) {
			const slot = x.toString();

			if (data.inventoryUser[slot] !== undefined) {
				const v = data.inventoryUser[slot];
				const item = `<div class="item populated" style="background-image: url('nui://vrp_inventory/web-side/images/${v.index}.png');" data-item-key="${v.key}" data-name-key="${v.name}" data-slot="${slot}">
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

		for (let x=1; x <= inSlots; x++) {
			const slot = x.toString();

			if (nameList2[x-1] !== undefined) {
				const v = nameList2[x-1];
				const item = `<div class="item2 populated" style="background-image: url('nui://vrp_inventory/web-side/images/${v.index}.png');" data-item-key="${v.key}" data-name-key="${v.name}" data-slot="${slot}">
					<div id="peso">${(v.weight).toFixed(2)}</div>
					<div id="quantity">$${formatarNumero(v.price)}</div>
					<div id="itemname">${v.name}</div>

					${v.durability !== undefined ? `<div id="durability"><div id="durability2" style="width: ${v.durability*10}%"></div></div>`:`<div id="nonebility"></div>`}
				</div>`;

				document.getElementById("invright").innerHTML = `${document.getElementById("invright").innerHTML} ${item}`;
			} else {
				const item = `<div class="item2 empty" data-slot="${slot}"></div>`;

				document.getElementById("invright").innerHTML = `${document.getElementById("invright").innerHTML} ${item}`;
			}
		}
		updateDrag();
	});
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