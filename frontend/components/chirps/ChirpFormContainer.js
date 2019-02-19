import ChirpForm from './ChirpForm';
import { receiveChirp } from '../../actions/chirpActions';
import { connect } from 'react-redux';

const mapDispatchToProps = dispatch => {
  return {
    receiveChirp: chirp => dispatch(receiveChirp(chirp)),
  };
};

export default connect(null, mapDispatchToProps)(ChirpForm);