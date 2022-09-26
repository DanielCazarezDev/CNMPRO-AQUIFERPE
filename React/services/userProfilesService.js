import axios from 'axios';
import { API_HOST_PREFIX, onGlobalSuccess, onGlobalError } from './serviceHelpers';

const endpoint = {
    userProfileUrl: `${API_HOST_PREFIX}/api/userprofiles`,
};

const getCurrentUserProfile = () => {
    const config = {
        method: 'GET',
        url: `${endpoint.userProfileUrl}/current`,
        withCredentials: true,
        crossdomain: true,
        headers: { 'Content-Type': 'application/json' },
    };
    return axios(config).then(onGlobalSuccess).catch(onGlobalError);
};

const getDashboard = () => {
    const config = {
        method: 'GET',
        url: `${endpoint.userProfileUrl}/dashboard`,
        withCredentials: true,
        crossdomain: true,
        headers: { 'Content-Type': 'application/json' },
    };
    return axios(config).then(onGlobalSuccess).catch(onGlobalError);
};

const userProfilesService = {
    getCurrentUserProfile,
    getDashboard,
};

export default userProfilesService;
