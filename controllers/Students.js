const Student = require("../models/StudentModel.js");
const argon2 = require("argon2");

exports.getStudent = async(req, res) => {
    try {
        const response = await Student.findOne({
            attributes: ['id', 'user_id', 'name_student', 'phone_parent', 'address','gender', 'age']
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
}

exports.getStudentById = async(req, res) => {
    try {
        const response = await Student.findOne({
            attributes: ['id', 'user_id', 'name_student', 'phone_parent','address','gender', 'age'],
            where: {
                id: req.params.id
            }
        });
        res.status(200).json(response);
    } catch (error) {
        res.status(500).json({ msg: error.message });
    }
}

exports.createStudent = async(req, res) => {
    const {id,user_id, name_student, phone_parent, phone, address,gender, age, } = req.body;
    try {
        await Student.create({
            id: id,
            user_id: user_id,
            name_student: name_student,
            phone_parent: phone_parent,
            address: address,
            gender: gender,
            age: age,
        });
        res.status(201).json({ msg: "Create Berhasil" });
    } catch (error) {
        res.status(400).json({ msg: error.message });
    }
}

exports.updateStudent = async(req, res) => {
    const student = await Student.findOne({
        where: {
            id: req.params.id
        }
    });
    if (!student) return res.status(404).json({ msg: "tidak ditemukan" });
    const {id, user_id, name_student, phone_parent, phone, address, gender, age, } = req.body;
    try {
        await Student.update({
            id: id,
            user_id: user_id,
            name_student: name_student,
            phone_parent: phone_parent,
            address: address,
            gender: gender,
            age: age,
        }, {
            where: {
                id: student.id
            }
        });
        res.status(200).json({ msg: "Updated" });
    } catch (error) {
        res.status(400).json({ msg: error.message });
    }
}

exports.deleteStudent = async(req, res) => {
    const student = await Student.findOne({
        where: {
            id: req.params.id
        }
    });
    if (!student) return res.status(404).json({ msg: "tidak ditemukan" });
    try {
        await Student.destroy({
            where: {
                id: student.id
            }
        });
        res.status(200).json({ msg: "Deleted" });
    } catch (error) {
        res.status(400).json({ msg: error.message });
    }
}