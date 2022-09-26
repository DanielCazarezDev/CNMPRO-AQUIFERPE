import { lazy } from 'react';

const AddBlog = lazy(() => import('../pages/blog/AddBlog'));
const AddJob = lazy(() => import('../components/jobs/AddJob'));
const AddResume = lazy(() => import('../components/resumes/AddResume'));
const AnalyticsDashboards = lazy(() => import('../pages/dashboard/analytics/index'));
const CheckoutForm = lazy(() => import('../pages/stripe/CheckoutForm'));
const FileManager = lazy(() => import('../components/filemanager/FileManager'));
const OrgAdmin = lazy(() => import('../pages/wizard/OrgAdmin'));
const OrganizationDashboard = lazy(() => import('../pages/dashboard/organization/OrgAdminDashboard'));
const PageNotFound = lazy(() => import('../pages/error/PageNotFound'));
const PdfRenderExample = lazy(() => import('../pages/dynamicpdf/PdfRenderExample'));
const Proposals = lazy(() => import('../components/proposals/Proposals'));
const LicenseVerification = lazy(() => import('../pages/verificationpage/LicenseVerification'));
const Subscriptions = lazy(() => import('../pages/stripe/Subscriptions'));
const SuccessPg = lazy(() => import('../pages/stripe/SuccessPg'));
const SurveyDashboard = lazy(() => import('../pages/surveys/SurveyDashboard'));
const Timesheet = lazy(() => import('../pages/timesheet/Timesheet'));
const TransactionMonitor = lazy(() => import('../pages/stripe/TransactionMonitor'));
const UserOnboarding = lazy(() => import('../components/useronboarding/UserOnboarding'));
const UserDashboard = lazy(() => import('../components/userdashboard/UserDashboard'));
const ViewProposals = lazy(() => import('../components/proposals/ViewProposals'));
const FaqForm = lazy(() => import('../pages/faqs/FaqForm'));
const JobSchedules = lazy(() => import('../pages/jobschedule/JobSchedule'));

const dashboardRoutes = [
    {
        path: '/dashboard',
        name: 'Dashboards',
        icon: 'uil-home-alt',
        header: 'Navigation',
        children: [
            {
                path: '/dashboard',
                name: 'Analytics',
                element: AnalyticsDashboards,
                roles: ['Admin'],
                exact: true,
                isAnonymous: false,
            },
        ],
    },
];

const licenseVerification = [
    {
        path: '/verification',
        name: 'Verify License',
        element: LicenseVerification,
        roles: ['Admin', 'User'],
        exact: true,
        isAnonymous: true,
    },
];
const subscriptions = [
    {
        path: '/subscriptions',
        name: 'Subscriptions',
        element: Subscriptions,
        roles: ['Org Admin'],
        exact: true,
        isAnonymous: false,
    },
    {
        path: '/checkoutForm',
        name: 'CheckoutForm',
        element: CheckoutForm,
        roles: ['Org Admin'],
        exact: true,
        isAnonymous: false,
    },
    {
        path: '/subscriptions/successPg',
        name: 'SuccessPg',
        element: SuccessPg,
        roles: ['Org Admin'],
        exact: true,
        isAnonymous: false,
    },
    {
        path: '/transactionMonitor',
        name: 'TransactionMonitor',
        element: TransactionMonitor,
        roles: ['Admin'],
        isAnonymous: false,
    },
];

const orgDashRoutes = [
    {
        path: '/admin/organization/dashboard',
        name: 'Organization Dashboard',
        element: OrganizationDashboard,
        roles: ['Org Admin'],
        exact: true,
        isAnonymous: false,
    },
    {
        path: '/admin/organization/job/add',
        name: 'Add Job',
        exact: true,
        element: AddJob,
        roles: ['Org Admin'],
        isAnonymous: true,
    },
];

const proposals = [
    {
        path: '/proposals',
        name: 'Proposals',
        exact: true,
        element: Proposals,
        roles: ['User'],
        isAnonymous: false,
    },
    {
        path: '/proposals/all',
        name: 'ViewProposals',
        exact: true,
        element: ViewProposals,
        roles: ['User'],
        isAnonymous: false,
    },
];

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

const timesheets = [
    {
        path: '/timesheet/user',
        name: 'Timesheet',
        exact: true,
        element: Timesheet,
        roles: ['User'],
        isAnonymous: false,
    },
];

const pdfRender = [
    {
        path: '/renderpdf',
        name: 'PDF Reader Example',
        element: PdfRenderExample,
        roles: ['Admin', 'User', 'Org Admin'],
        exact: true,
        isAnonymous: false,
    },
];

const faq = [
    {
        path: '/faq/new',
        name: 'FaqNew',
        element: FaqForm,
        roles: ['Admin'],
        exact: true,
        isAnonymous: false,
    },
    {
        path: '/faq/:id',
        name: 'FaqEdit',
        element: FaqForm,
        roles: ['Admin'],
        exact: true,
        isAnonymous: false,
    },
];
const orgAdmin = [
    {
        path: '/orgadmin/initialsetup',
        name: 'OrgAdmin',
        element: OrgAdmin,
        roles: ['Org Admin'],
        exact: true,
        isAnonymous: false,
    },
    {
        path: '/orgadmin/edit/:id',
        name: 'OrgEdit',
        element: OrgAdmin,
        roles: ['Org Admin'],
        exact: true,
        isAnonymous: false,
    },
];
const surveyDashboard = [
    {
        path: '/admin/surveys',
        name: 'SurveyDashboard',
        element: SurveyDashboard,
        roles: ['Admin', 'Org Admin'],
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

const userOnboarding = [
    {
        path: '/onboarding',
        name: 'onboarding',
        element: UserOnboarding,
        roles: ['User'],
        exact: true,
        isAnonymous: true,
    },
];

const resume = [
    {
        path: '/resumes',
        name: 'Resumes',
        element: AddResume,
        roles: ['User'],
        exact: true,
        isAnonymous: false,
    },
];

const blogs = [
    {
        path: '/addblog',
        name: 'AddBlog',
        exact: true,
        element: AddBlog,
        roles: ['User', 'Admin'],
        isAnonymous: true,
    },
    {
        path: '/editblog/:blogId',
        name: 'EditBlog',
        exact: true,
        element: AddBlog,
        roles: ['User', 'Admin'],
        isAnonymous: true,
    },
];

const jobschedule = [
    {
        path: '/schedules',
        name: 'Job Schedule',
        element: JobSchedules,
        roles: ['Admin', 'User', 'OrgAdmin'],
        exact: true,
        isAnonymous: false,
    },
];

const allRoutes = [
    ...blogs,
    ...dashboardRoutes,
    ...errorRoutes,
    ...pdfRender,
    ...fileManager,
    ...subscriptions,
    ...timesheets,
    ...orgDashRoutes,
    ...proposals,
    ...resume,
    ...userOnboarding,
    ...licenseVerification,
    ...userProfile,
    ...jobschedule,
    ...faq,
    ...orgAdmin,
    ...surveyDashboard,
];

export default allRoutes;
