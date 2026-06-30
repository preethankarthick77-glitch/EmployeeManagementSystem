const db = require('../config/db');

// View All Departments
exports.getAllDepartments = async (req, res) => {
    try {
        const departments = await db.query('SELECT * FROM departments ORDER BY id DESC');
        res.render('departments', { departments: departments.rows, error: null });
    } catch (err) {
        res.status(500).send('Database Error');
    }
};

// Create Department
exports.createDepartment = async (req, res) => {
    const { name, description } = req.body;
    if (!name) {
        const departments = await db.query('SELECT * FROM departments ORDER BY id DESC');
        return res.render('departments', { departments: departments.rows, error: 'Department Name is required.' });
    }

    try {
        await db.query('INSERT INTO departments (name, description) VALUES ($1, $2)', [name, description]);
        res.redirect('/departments');
    } catch (err) {
        res.status(500).send('Department already exists or Database Error.');
    }
};

// Get Single Department Data for Editing
exports.getEditDepartmentPage = async (req, res) => {
    try {
        const dept = await db.query('SELECT * FROM departments WHERE id = $1', [req.params.id]);
        if (dept.rows.length === 0) return res.status(404).send('Department not found');
        res.render('edit-department', { department: dept.rows[0], error: null });
    } catch (err) {
        res.status(500).send('Server Error');
    }
};

// Update Department
exports.updateDepartment = async (req, res) => {
    const { name, description } = req.body;
    const { id } = req.params;

    if (!name) {
        return res.render('edit-department', { department: { id, name, description }, error: 'Name cannot be blank.' });
    }

    try {
        await db.query('UPDATE departments SET name=$1, description=$2 WHERE id=$3', [name, description, id]);
        res.redirect('/departments');
    } catch (err) {
        res.status(500).send('Update Failed.');
    }
};

// Delete Department
exports.deleteDepartment = async (req, res) => {
    try {
        await db.query('DELETE FROM departments WHERE id = $1', [req.params.id]);
        res.redirect('/departments');
    } catch (err) {
        res.status(500).send('Deletion Failed.');
    }
};
