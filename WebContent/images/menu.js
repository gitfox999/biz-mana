// JavaScript Document
function show(str)
{
	var str1="td"+str;
	var str="show"+str;
	document.getElementById("td1").style.background="url('images/l_b_031.gif')";
	document.getElementById("td2").style.background="url('images/l_b_031.gif')";
	document.getElementById("td3").style.background="url('images/l_b_031.gif')";
	document.getElementById("td4").style.background="url('images/l_b_031.gif')";
	document.getElementById("td5").style.background="url('images/l_b_031.gif')";
	document.getElementById("show1").style.display="none";
	document.getElementById("show2").style.display="none";
	document.getElementById("show3").style.display="none";
	document.getElementById("show4").style.display="none";
	document.getElementById("show5").style.display="none";
	document.getElementById("show6").style.display="none";
	document.getElementById(str1).style.background="url('images/l_b_051.gif')";
	document.getElementById(str).style.display="block";
}
function sho(str)
{
	var str1="t"+str;
	var str="sho"+str;
	document.getElementById("t1").style.background="url('images/2_14.gif')";
	document.getElementById("t2").style.background="url('images/2_14.gif')";
	document.getElementById("t3").style.background="url('images/2_14.gif')";
	document.getElementById("t4").style.background="url('images/2_14.gif')";
	document.getElementById("t5").style.background="url('images/2_14.gif')";
	document.getElementById("sho1").style.display="none";
	document.getElementById("sho2").style.display="none";
	document.getElementById("sho3").style.display="none";
	document.getElementById("sho4").style.display="none";
	document.getElementById("sho5").style.display="none";
	document.getElementById(str1).style.background="url('images/3_13.gif')";
	document.getElementById(str).style.display="block";
}
 		 //Actions of Result Form, old Action
function mouse_over(obj){
  obj.style.backgroundColor = "#CCCCCC";
  //FFC080
  //FFFF33
}

function mouse_over_enableclick(obj){
	  obj.style.backgroundColor = "#FFD38E";
	    obj.className="cursor"
	 
}
function mouse_out(obj){
   obj.style.backgroundColor = "";

}

