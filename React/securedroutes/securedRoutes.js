import { lazy } from 'react';

const FileManager = lazy(() => import('../components/filemanager/FileManager'));
const UserDashboard = lazy(() => import('../components/userdashboard/UserDashboard'));

const fileManager = [
    {
        path: '/filemanager',
        name: 'FileManager',
        exact: true,
        element: FileManager,
        roles: ['Admin'],
        isAnonymous: false,
    },
];

const errorRoutes = [
    {
        path: '*',
        name: 'Error - 404',
        element: PageNotFound,
        roles: [],
        exact: true,
        isAnonymous: false,
    },
];

const userProfile = [
    {
        path: 'dash/user',
        name: 'UserDashboard',
        element: UserDashboard,
        roles: ['Admin', 'User'],
        exact: true,
        isAnonymous: false,
    },
];


const allRoutes = [
    ...fileManager,
    ...userProfile,
];

export default allRoutes;
