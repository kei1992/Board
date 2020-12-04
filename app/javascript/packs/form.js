import $ from 'jquery'

// 新規募集ボタン
$('#board-form-title-content').keyup(function () {
	let boardTitle = $('#board-form-title-content').val()
	let titleCount = boardTitle.length
	if (titleCount > 50) {
		$('#title-warning').removeClass('hidden')
	} else {
		$('#title-warning').addClass('hidden')
	}
	$('.showTitleCount').text(titleCount)
})

$('#board-form-content').keyup(function () {
	let boardContent = $('#board-form-content').val()
	let boardContentNoHTML = $(boardContent).text()
	let contentCount = boardContentNoHTML.length
	if (contentCount > 10) {
		$('#content-warning').removeClass('hidden')
	} else {
		$('#content-warning').addClass('hidden')
	}
	$('.showCount').text(contentCount)
})

// タイトル入力クリアボタンの表示
$('#board-form-title-content').on('click', function () {
	$('#title-introduction').removeClass('hidden')
	$('#input-reset-btn').prop('disabled', true)
	$(this).on('input', function () {
		let inputNew = $(this).val()
		if (inputNew.length > 0) {
			$("#input-reset-btn").prop("disabled", false);
			$('#title-introduction').addClass('hidden')
		} else {
			$("#input-reset-btn").prop("disabled", true);
			$('#title-introduction').removeClass('hidden')
		}
	})
})

// 内容入力クリアボタンの表示
$('#board-form-content').on('click', function () {
	$('#content-introduction').removeClass('hidden')
	$('#input-content-reset-btn').prop('disabled', true)
	$(this).on('input', function () {
		let inputContentNew = $(this).val()
		let inputContentRemove= $(inputContentNew).text()
		if (inputContentRemove.length > 0) {
			$("#input-content-reset-btn").prop("disabled", false);
			$('#content-introduction').addClass('hidden')
		} else {
			$("#input-content-reset-btn").prop("disabled", true);
			$('#content-introduction').removeClass('hidden')
		}
	})
})

// タイトル・内容入力クリア機能
$('#input-reset-btn').on('click', function () {
	$('#board-form-title-content').val("")
})

$('#input-content-reset-btn').on('click', function () {
	$('#board-form-content').val("")
})

// 募集内容欄
$('#board-form-content').keyup(function () {
	let boardContent = $('#board-form-content').val()
	let boardContentNew = $(boardContent).text()
	let contentCount = boardContentNew.length
	if (contentCount >= 1000) {
		window.alert("1,000文字以内で入力してください")
	}
	$('.showCount').text(contentCount)
})

// DMメッセージボタン
$(function () {
	$('#message-content').on('click', function () {
		$("#message-submit").prop("disabled", true);
		$(this).on('input', function () {
			let input = $(this).val()
			if (input.length > 0) {
				$("#message-submit").prop("disabled", false);
			} else {
				$("#message-submit").prop("disabled", true);
			}
		})
	})
})