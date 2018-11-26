window.onload=function(){                 
	changeDivHeight();	            
}              
window.onresize=function(){	             
	changeDivHeight();              
}              
function changeDivHeight(){                            
	var my_w = document.documentElement.clientWidth;
	if(my_w<='900'){		
		document.getElementById('select_criteria_main').style["margin-left"] = "5%";
		document.getElementById('select_main').style["margin-left"] = "0%";
	}
	else{
		document.getElementById('select_criteria_main').style["margin-left"] = "10%";
		document.getElementById('select_main').style["margin-left"] = "10%";
	}
}  

