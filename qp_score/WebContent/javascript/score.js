	function inicio() {
		{ 	

			var cont = 0;
						async: false,  
			$.ajax({    type : "GET",
						url : "http://CHD-QSISTEMS:8080/qp_score/rest/consultas/listaMarcas",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(response) {

							$.each(response,function(index, product) {
								
								//PINTADO DE IMAGEN DESDE BASE DE DATOS
								$("#"+ response[index].nombre_marca).css("background-image", "url('"+ response[index].ruta_objeto_marca + "' )");

								if(response[index].nombre_marca=="EXCELENTE")			
								{
									$("#EXCELENTE").attr("value",response[index].id_marca);
									$("#EXCELENTE").attr("id",response[index].id_marca);
								}
									if(response[index].nombre_marca=="MUY BUENO")			
									{	$("#MUY_BUENO").css("background-image", "url('"+ response[index].ruta_objeto_marca + "' )");
										$("#MUY_BUENO").attr("value",response[index].id_marca);
										$("#MUY_BUENO").attr("id",response[index].id_marca);
										}
										if(response[index].nombre_marca=="BUENO")			
										{	
											$("#BUENO").attr("value",response[index].id_marca);
											$("#BUENO").attr("id",response[index].id_marca);
											
										}
											if(response[index].nombre_marca=="REGULAR")			
											{	
												$("#REGULAR").attr("value",response[index].id_marca);
												$("#REGULAR").attr("id",response[index].id_marca);
											}
												if(response[index].nombre_marca=="MALO")			
											{	
													$("#MALO").attr("value",response[index].id_marca);
													$("#MALO").attr("id",response[index].id_marca);
											}

							}); // FIN EACH

						},
						error : function(response) {
							console.log("error");
						}
					});
		}// FIN DE LA FUNCION DE INICIO
	}
	
	//---------------------------------------------------------------------------------------------------------------------
	
	function showDiv(n) {
		document.getElementById("div" + n).style.display = 'block'
		return false;
	}

	function hideDiv(n) {
		for (x = 1; x <= 10; x++) {
			document.getElementById("div" + x).style.display = 'none'
		}
		document.getElementById(n).style.display = 'block'
		return false;
	}

	function toggleDiv(id) {
		for (x = 1; x <= 3; x++) {
			document.getElementById("div" + x).style.display = 'none';
		}

		document.getElementById(id).style.display = 'block';
	}
	
	function returnCalificacion() {
		toggleDiv("div1");
		 $('#enviar').click();
	}
	
	//---------------------------------------------------------------------------------------------------------------------
	
	
	function submenu(marca) {
		var nombre_marca = marca;
		{
			$('#btrespuesta1').hide(); $('#btrespuesta2').hide(); $('#btrespuesta3').hide(); $('#btrespuesta4').hide(); $('#btrespuesta5').hide();
			
			var cont = 0;
			$.ajax({    async: false,
						type : "GET",
						url : "http://CHD-QSISTEMS:8080/qp_score/rest/consultas/listaMarcas",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(response) {
							$.each(response,function(index, product) {
								cont++;							
								if(response[index].nombre_marca== nombre_marca)			
								{
									if(nombre_marca =="MUY BUENO")
										{nombre_marca= "MUY_BUENO"}
									if(response[index].opcion_pregunta== 1)
									{
										
										$("#" + nombre_marca).on("click",toggleDiv('div2'));  // DIV 2 ES PREGUNTAS
										pregunta(nombre_marca);
									}else		
									{
										$("#" + nombre_marca).on("click",toggleDiv('div3'));  // DIV 3 ES GRACIAS	
									}
								}
							}); // FIN EACH
						},
						error : function(response) {
							console.log("error");
						}
					});
		} // AJAX

	}
	
	//---------------------------------------------------------------------------------------------------------------
	
	function pregunta(nombre_marca) {
		{ // FUNCION DE CARGA DE PREGUNTAS EN PANTALLA SOBRE LABEL
			var nombre_marca_p=nombre_marca;
			var cont = 0;
			var id_marca;
			var nombre_marca;
			$.ajax({    async: false,
						type : "GET",
						url : "http://chd-qsistems:8080/qp_score/rest/consultas/listaEncuesta",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(response) {

							$.each(response,function(index, product) {
							if(response[index].nombre_marca == nombre_marca_p)	
								{
									$("#btrespuesta1").css("background-image", "url('"+ rutaO(response[index].id_marca_opcion_1) + "' )");
									$("#question").text(response[index].pregunta_encuesta);
									//$("#rquestion").text(response[index].id_encuesta);
									$("#rquestion").attr("value",response[index].id_encuesta);
									//$('#ValCal').val($(response[index].id_encuesta).attr("id"));
									id_marca=response[index].id_marca_opcion_1;

									if(response[index].id_marca_opcion_1 != "null")
									{   $("#btrespuesta1").css("background-image", "url('"+ rutaO(response[index].id_marca_opcion_1) + "' )");
										nombre_marca=marca(response[index].id_marca_opcion_1);
										$('#btrespuesta1').html(nombre_marca);
										$("#btrespuesta1").attr("value",response[index].id_marca_opcion_1);
										$('#btrespuesta1').show();									
									}
									
									if(response[index].id_marca_opcion_2 != "null")
									{	$("#btrespuesta2").css("background-image", "url('"+ rutaO(response[index].id_marca_opcion_1) + "' )");
										nombre_marca=marca(response[index].id_marca_opcion_2);
										$('#btrespuesta2').html(nombre_marca);
										$("#btrespuesta2").attr("value",response[index].id_marca_opcion_2);
										$('#btrespuesta2').show();									
									}

									if(response[index].id_marca_opcion_3 != "null")
									{ 	$("#btrespuesta3").css("background-image", "url('"+ rutaO(response[index].id_marca_opcion_1) + "' )");
										nombre_marca=marca(response[index].id_marca_opcion_3);
										$('#btrespuesta3').html(nombre_marca);
										$("#btrespuesta3").attr("value",response[index].id_marca_opcion_3);

										$('#btrespuesta3').show();									
									}

									if(response[index].id_marca_opcion_4 != "null")
									{	$("#btrespuesta4").css("background-image", "url('"+ rutaO(response[index].id_marca_opcion_1) + "' )");
										nombre_marca=marca(response[index].id_marca_opcion_4);
										$('#btrespuesta4').html(nombre_marca);
										$("#btrespuesta4").attr("value",response[index].id_marca_opcion_4);
										$('#btrespuesta4').show();									
									}

									if(response[index].id_marca_opcion_5 != "null")
									{	$("#btrespuesta5").css("background-image", "url('"+ rutaO(response[index].id_marca_opcion_1) + "' )");
										nombre_marca=marca(response[index].id_marca_opcion_5);
										$('#btrespuesta5').html(nombre_marca);
										$("#btrespuesta5").attr("value",response[index].id_marca_opcion_5);
										$('#btrespuesta5').show();									
									}

								}	
							}); // FIN EACH

						},
						error : function(response) {
							console.log("error");
						}
					});
		}// FIN DE LA FUNCION DE INICIO
	}
	
	//-------------------------------------------------------------------------------------------------------------------
	
	
	function marca(id_marca) {
		{ 
			var id_marca_p=id_marca;
			var cont = 0;
			var retorno;
			$.ajax({    async: false,
						type : "GET",
						url : "http://CHD-QSISTEMS:8080/qp_score/rest/consultas/listaMarcas",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(response) {

							$.each(response,function(index, product) {
							if(response[index].id_marca == id_marca_p)	
								{
									retorno=response[index].nombre_marca;
								}
							}); // FIN EACH

						},
						error : function(response) {
							console.log("error");
						}
					});
		}// 
		return retorno;	
  }

	//----------------------------------------------------------------------------------------------
	
	
	function rutaO(id_marca) {
		{ 
			var id_marca_p=id_marca;
			var cont = 0;
			var retorno;
			$.ajax({    async: false,
						type : "GET",
						url : "http://CHD-QSISTEMS:8080/qp_score/rest/consultas/listaMarcas",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success : function(response) {

							$.each(response,function(index, product) {
							if(response[index].id_marca == id_marca_p)	
								{
									retorno=response[index].ruta_objeto_marca;
								}
							}); // FIN EACH

						},
						error : function(response) {
							console.log("error");
						}
					});
		}// 
		return retorno;	
  }
	
	//-------------------------------------------------------------------------------------------------------------
		