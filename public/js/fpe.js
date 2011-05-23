

	function fpe_por_estado(estado) {
		var URL = "http://localhost:4567/fpe";
		var dados = open_html_doc(URL);
		return dados;
	}



function open_html_doc(url) {
			var xhr = new XMLHttpRequest();
			//xhr.setRequestHeader("Content-Type", "text/html;charset=utf-8");		
			xhr.open("GET", url, false);
			xhr.send();

			return xhr.responseText;
}
