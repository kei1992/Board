import $ from 'jquery'
import axios from 'axios'

// $(function () {
// 	$('.show-board-form').on('click', () => {
// 		$('.show-board-form').addClass('hidden')
// 		$('.add_new_board_name').removeClass('hidden')
// 		$('.add_new_board_description').removeClass('hidden')
// 		$('.post-new-board').removeClass('hidden')
// 	})

// 	$('.close-board-form').on('click', () => {
// 		$('.show-board-form').removeClass('hidden')
// 		$('.add_new_board_name').addClass('hidden')
// 		$('.add_new_board_description').addClass('hidden')
// 		$('.post-new-board').addClass('hidden')
// 	})

// 	$('.post-new-board').on('click', () => {
// 		const boardName = $('#board_name').val()
// 		const boardDescription = $('#board_description').val()
// 		const tagList = $('#tag_list').val()
// 		if (!boardDescription || !boardName) {
// 			window.alert('Please fill in the form.')
// 		} else {
// 			axios.post(`/boards`, { board: { name: boardName, description: boardDescription, tag_list: tagList } })
// 				.then((response) => {
// 					window.alert('Successfully posted')
// 					$('#board_name').val('')
// 					$('#board_description').val('')
// 					$('#tag_list').val('')
// 				})
// 			history.go(0)
// 		}
// 	})
// })
