const { Sequelize } = require("sequelize");
const db = require("../config/database.js");

const { DataTypes } = Sequelize;

const Students = sequelize.define(
  "students",
  { name_student: Sequelize.STRING },
  { timestamps: false }
);

const ClassSchedule = sequelize.define(
  "class_schedule",
  { product_id: Sequelize.INTEGER },
  { timestamps: false }
);

const StudentProgress = sequelize.define(
  "student_progress",
  {},
  { timestamps: false }
);

module.exports = Progress;