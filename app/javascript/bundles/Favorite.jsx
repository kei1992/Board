import PropTypes from 'prop-types';
import React, { useState } from 'react';
import { HeartFill } from 'react-bootstrap-icons';
import axios from 'axios'

axios.defaults.headers['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

const Favorite = (props) => {
	const { boardId, favoriteId } = props;
	const [id, setId] = useState(favoriteId);
	const [count, setCount] = useState(0)

	const clicked = async () => {
		if (id == null) {
			const { data: { id = null } } = await axios.post('/favorites', { board_id: boardId })
			id && setId(id);
		} else {
			await axios.delete(`/favorites/${id}`)
			setId(null);
		}
	}

	return (
		<>
			<HeartFill
				color={id ? 'red' : '#616161'}
				size={25}
				onClick={clicked}
			/>
		</>
	);
};

Favorite.propTypes = {};

export default props => <Favorite {...props} />;