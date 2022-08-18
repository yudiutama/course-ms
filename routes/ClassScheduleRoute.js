const express = require("express");
const {
    getSchedule,
    getScheduleById,
    createSchedule,
    updateSchedule,
    deleteSchedule
} = require("../controllers/ClassSchedule.js");
const router = express.Router();

router.get('/class-schedule', getSchedule);
router.get('/class-schedule/:id', getScheduleById);
router.post('/class-schedule', createSchedule);
router.patch('/class-schedule/:id', updateSchedule);
router.delete('/class-schedule/:id', deleteSchedule);

module.exports = router;