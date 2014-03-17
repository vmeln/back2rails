$('#cart form[action^="/carts/"] input:submit').submit ->
	$(this).parents("#cart").hide('blind', 1000)