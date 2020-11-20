import PropTypes from 'prop-types';
import React, { useState } from 'react';
import axios from 'axios'

axios.defaults.headers['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

const TextCounter = (props) => {
	const [count, textCount] = useState(0)

	return (
		<>
			<div>文字数：{this.state.count}</div>
		</>
	);
};

TextCounter.propTypes = {};

export default props => <TextCounter {...props} />;