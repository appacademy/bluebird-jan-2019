import ChirpIndex from './ChirpIndex';
import { selectAllChirps } from '../../reducers/selectors';
import { connect } from 'react-redux';

const mapStateToProps = state => {
  return {
    chirps: selectAllChirps(state),
  };
};

export default connect(mapStateToProps)(ChirpIndex);