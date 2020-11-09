// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery3
//= require popper
//= require bootstrap-sprockets

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

const { default: Axios } = require("axios")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")

import $ from 'jquery'

$(function () {
	const pageTop = $('.scrollTop')
	pageTop.hide()
	$(window).scroll(function () {
		if ($(this).scrollTop() > 100) {
			pageTop.fadeIn()
		} else {
			pageTop.fadeOut()
		}
	})
	pageTop.click(function () {
		$('body,html').animate({ scrollTop: 0 }, 500)
	})
})


$(document).on('click', '.dropdown-header-hidden', () => {
	$('.userProfileEmail').removeClass('hidden')
})

// モーダル操作
const modalOpen = $(document).on('click', '.modal-btn', () => {
	$('.modal-background').fadeIn(100)
	$('.modal').fadeIn(100)
	$('.hidden_btn').fadeIn(100)
})

$(document).on('click', '.hidden_btn', () => {
	$('.hidden_btn').fadeOut(100)
	$('.modal-background').fadeOut(100)
	$('.modal').fadeOut(100)
})


$(document).on('click', '.uparrow', () => {
	$('.new_board').fadeOut(100)
	$('.container-board').fadeIn()
	$('.modal-note').on('click', () => {
		$('.new_board').css('display', 'block')
	})
})

// 新記事投稿
$(document).on('click', '.modal-note', () => {
	$('.modal-background').fadeOut(100)
	$('.modal').fadeOut(100)
	$('.hidden_btn').fadeOut(100)
	$('.container-board').fadeOut(10)
	$('.new_board').removeClass('hidden')
	$('.add_new_board_name').removeClass('hidden')
	$('.add_new_board_description').removeClass('hidden')
	$('.post-new-board').removeClass('hidden')
})