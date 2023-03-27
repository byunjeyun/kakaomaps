/**
 * 
 */
 
 
 /**
 * 
 */
 
 function inputCheck() {
	
	if(document.reg_frm.requestgr.value.length == 0) {
		alert("업무구분을 입력해주세요");
		reg_frm.requestgr.focus();
		return;		
	}
	
	
	document.reg_frm.submit();
	
}
	
 function updateCheck() {
	
	if(document.update_frm.factnm.value.length == 0) {
		alert("사업장을 선택해주세요");
		update_frm.requestgr.focus();
		return;		
	}
	
	
	document.update_frm.submit();
	
}


function finputCheck() {

	
	if(document.freg_frm.factnm.value.length == 0) {
		alert("사업장명을 입력해주세요");
		freg_frm.factnm.focus();
		return;		
	}
	
	alert("사업장이 등록되었습니다.")	
	document.freg_frm.submit();
	
}
