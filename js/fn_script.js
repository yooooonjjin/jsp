/**
 * 
 */

function fn_board_submit() {
	let f = document.frm;
	if( f.title.value == "" ) {
		alert("제목을 입력해 주세요!");
		f.title.focus();
		return false;
	}
	if( f.pass.value == "" ) {
		alert("암호를 입력해 주세요!");
		f.pass.focus();
		return false;
	}
	f.submit();
}