import React from 'react';

import { connect } from 'react-redux';
import { selectAllChirps } from '../../reducers/selectors';

const ChirpIndex = ({ chirps }) => (
  <ul className='chirp-index'>
    {
      chirps.map(chirp => (
        <li key={chirp.id}>{chirp.body}</li>
      ))
    }
  </ul>
);

const mapStateToProps = state => {
  return {
    chirps: selectAllChirps(state),
  };
};

export default connect(mapStateToProps)(ChirpIndex);