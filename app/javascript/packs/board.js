import $ from 'jquery'
import axios from 'axios'

document.addEventListener('DOMContentLoaded', () => {
	$('.card_name').on('click', () => {
		axios.get('/')
			.then((response) => {
				console.log(response)
			})
	})
})