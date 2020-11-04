import $ from 'jquery'
import axios from 'axios'

const { default: Axios } = require("axios")

const handleCommentForm = () => {
	$('.show-comment-form').on('click', () => {
		$('.show-comment-form').addClass('hidden')
		$('.add-comment-button').removeClass('hidden')
		$('.comment-text-area').removeClass('hidden')
	})
}

const appendNewComment = (comment) => {
	$('.comment-container').append(
		`<div class="task_comment">
			<p>${comment.description}</p>
		</div>`
	)
}

document.addEventListener('DOMContentLoaded', () => {
	const dataset_board = $(`#task-show`).data()
	const boardId = dataset_board.boardId
	const dataset_task = $(`#task-show`).data()
	const taskId = dataset_task.taskId

	axios.get(`/boards/${boardId}/tasks/${taskId}/comments`)
		.then((response) => {
			const comments = response.data
			comments.forEach((comment) => {
				appendNewComment(comment)
			})
		})

	handleCommentForm()


	$('.add-comment-button').on('click', () => {
		const content = $('#comment_content').val()

		if (!content) {
			window.alert('コメントを入力してください')
		} else {
			axios.post(`/boards/${boardId}/tasks/${taskId}/comments`, { comment: { description: content } })
				.then((res) => {
					const comment = res.data
					appendNewComment(comment)
					$('#comment_content').val('')
				})
		}
	})
})