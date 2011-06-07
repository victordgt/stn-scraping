


function fpe_get() {
	var uf = document.forms[0].uf.value;
	var ano = document.forms[0].ano.value;
	
	if ((uf != '' || uf != undefined) && (ano != '' || ano != undefined)) {
		url = 'http://stn-scraping.heroku.com/fpe/get?uf=' + uf + '&ano=' + ano + '&json=true'
		var json_txt = $.ajax({
		    type: 'GET',
		    url: url,
		    dataType: 'json',
			    success: function() { },
			    data: {},
			    async: false
		});	
		
		var json = jQuery.parseJSON(json_txt.responseText);
		var dados = json.valores;
		
		$("#simpleGraph").html('');		
		$("#simpleGraph").addClass('borda_div');

		
		$("#simpleGraph").jqBarGraph({
			data: dados,
			width: 1100,
			colors: ['#122A47','#1B3E69'],
			color: '#1A2944',
			barSpace: 60,
		});

	} else {
		alert('Preencha todos os campos!');
	}

	
}

