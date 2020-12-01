import $ from 'jquery'
import axios from 'axios'
import { useImperativeHandle } from 'react'

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
			<p>${comment.user_nickname}</p>
		</div>`
	)
}

document.addEventListener('DOMContentLoaded', () => {
	const dataset_task = $(`#task-show`).data()
	const boardId = dataset_task.boardId
	const taskId = dataset_task.taskId
	const userId = dataset_task.userId
	const userNickname = dataset_task.userNickname

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
			axios.post(`/boards/${boardId}/tasks/${taskId}/comments`, { comment: { user_id: userId, user_nickname: userNickname, description: content } })
				.then((res) => {
					const comment = res.data
					comment.user_id = userId
					comment.user_nickname = userNickname
					appendNewComment(comment)
					$('#comment_content').val('')
				})
		}
	})
})
