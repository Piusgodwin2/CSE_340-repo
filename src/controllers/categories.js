import {getAllCategories, getCategoryById, getProjectsByCategoryId} from '../models/categories.js';

const ShowCategoriesPage = async (req, res) => {
    const title = 'Categories';
    const categories = await getAllCategories();
    res.render('categories', { title, categories });
};

const showCategoryDetailsPage = async (req, res, next) => {
  const categoryId = req.params.id;

  const category = await getCategoryById(categoryId);

  if (!category) {
    const err = new Error('Category not found');
    err.status = 404;
    return next(err);
  }

  const projects = await getProjectsByCategoryId(categoryId);
  const title = category.name;

  res.render('category', { title, category, projects });
};

export {ShowCategoriesPage, showCategoryDetailsPage };
