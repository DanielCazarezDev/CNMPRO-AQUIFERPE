import {
   
    FcHome,
    FcGlobe,
    FcFilingCabinet,
} from 'react-icons/fc';

const MENU_ITEMS = [

    {
        roles: ['User'],
        key: 'userdashboard',
        label: 'Dashboard',
        isTitle: false,
        icon: FcHome,
        url: 'dash/user',
    },
    {
        roles: ['User', 'Org Admin', 'Admin'],
        key: 'blogs',
        label: 'Blogs',
        isTitle: false,
        icon: FcHome,
        url: '/blog',
    },
    {
        roles: ['Admin', 'User', 'Org Admin'],
        key: 'landing',
        label: 'Landing',
        isTitle: false,
        icon: FcGlobe,
        url: '/',
    },
    {
        roles: ['Admin'],
        key: 'filemanager',
        label: 'File Manager',
        isTitle: false,
        icon: FcFilingCabinet,
        url: '/filemanager',
    }
];

export default MENU_ITEMS;
