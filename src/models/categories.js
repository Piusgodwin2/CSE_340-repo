import db from './db.js';

const getAllCategories = async () => {

    const query = `
    SELECT c.category_id, c.name FROM category c`

    const result = await db.query(query);
    return result.rows;
}

// 1. Retrieve a single category by its ID
const getCategoryById = async (categoryId) => {
  const query = `
    SELECT category_id, name
    FROM category
    WHERE category_id = $1;
  `;

  const result = await db.query(query, [categoryId]);
  return result.rows.length > 0 ? result.rows[0] : null;
};

// 2. Retrieve all categories for a given service project
const getCategoriesByServiceProjectId = async (projectId) => {
  const query = `
    SELECT c.category_id, c.name
    FROM category c
    JOIN project_category pc ON c.category_id = pc.category_id
    WHERE pc.project_id = $1
    ORDER BY c.name;
  `;

  const result = await db.query(query, [projectId]);
  return result.rows;
};

// 3. Retrieve all service projects for a given category
const getProjectsByCategoryId = async (categoryId) => {
  const query = `
    SELECT
      p.project_id,
      p.title,
      p.description,
      p.project_date AS date,
      p.location,
      p.organization_id,
      o.name AS organization_name
    FROM service_project p
    JOIN project_category pc ON p.project_id = pc.project_id
    JOIN organization o ON p.organization_id = o.organization_id
    WHERE pc.category_id = $1
    ORDER BY p.project_date;
  `;

  const result = await db.query(query, [categoryId]);
  return result.rows;
};

export {getAllCategories, getCategoryById, getCategoriesByServiceProjectId, getProjectsByCategoryId};