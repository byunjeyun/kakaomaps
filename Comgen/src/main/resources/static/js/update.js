/**
 * 
 */
 
 function selectRow(requestno) {
    // 선택된 행의 id 값을 저장
    selectedRowId = `${requestno}`;

    // 두 번째 뷰로 전환
    // 예시: 선택된 행의 factnm 열에 입력 가능한 뷰로 전환
    var inputElement = $(`#${selectedRowId} td:eq(1) input`);
    inputElement.prop('disabled', false);
    inputElement.focus();

	var inputs = $(`#${selectedRowId} input`);
	for (var i = 0; i < inputs.length; i++) {
	  var inputElement = inputs.eq(i);
	  var columnName = inputElement.attr('name');
	  var columnValue = inputElement.val();
	  $(`#edit_${columnName}`).val(columnValue);
	}
	// 두 번째 뷰를 표시
	$('#editForm').show();


}

