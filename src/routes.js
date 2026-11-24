import express from 'express';

import { HomePage } from './controllers/index.js';
import { showOrganizationsPage } from './controllers/organizations.js';
import { ShowProjectsPage, showProjectDetailsPage } from './controllers/projects.js';
import {ShowCategoriesPage, showCategoryDetailsPage} from './controllers/categories.js';
import { testErrorPage } from './controllers/errors.js';
import { showOrganizationDetailsPage } from './controllers/organizations.js';

const router = express.Router();

router.get('/', HomePage);
router.get('/organizations', showOrganizationsPage);
router.get('/projects', ShowProjectsPage);
router.get('/categories', ShowCategoriesPage);

// error-handling routes
router.get('/test-error', testErrorPage);

// Route for organization details page
router.get('/organization/:id', showOrganizationDetailsPage);

//route for projects
router.get('/project/:id', showProjectDetailsPage);

// Add next to your existing /categories route
router.get('/categories', ShowCategoriesPage);
router.get('/category/:id', showCategoryDetailsPage);

export default router;
