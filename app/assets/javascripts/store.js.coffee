$(document).on "ready page:change", ->
	$('div div.row > img').click ->
		$(this).parent().find(':submit').click()