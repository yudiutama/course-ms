const Progress = require("../models/StudentReportsModel.js");

exports.getProgress = async(req, res) => {
    try {
        const response = await Progress.findAll({
            attributes: ['id', 'schedule_id', 'score']
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
}