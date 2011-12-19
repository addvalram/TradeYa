String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g,"");
}
String.prototype.ltrim = function() {
	return this.replace(/^\s+/,"");
}
String.prototype.rtrim = function() {
	return this.replace(/\s+$/,"");
}
function IsEmpty(aTextField) {
	if ((aTextField.value.trim().length == 0) || (aTextField.value == null)) {
    	return true;
	}else { 
		return false; 
	}
}	
var a4abc = null;
function abc(){
	a4abc = document.getElementById('xyz');
	a4abc.setSrc("http://www.google.co.in");
}
function getElmById(obj, id){
	var objs = obj.childNodes;
	for(var i = 0;i < objs.length;i++){
		if(objs[i].id.indexOf(id) > -1){
			a4abc = objs[i];
			return;
		}else{
			if(objs[i].childNodes.length > 0) procChild(objs[i].childNodes);
		}
	}
}
function procChild(objs){
	for(var i = 0;i < objs.length;i++){
		getElmById(objs[i], 'make_offer_page');
	}
}
