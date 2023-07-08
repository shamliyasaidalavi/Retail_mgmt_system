const mongoose = require("mongoose");

const schema = mongoose.Schema

const deliveryboySchema = new schema({
    login_id: { type: mongoose.Types.ObjectId, ref:'login_tb' },
    deliveryboy_name: { type: String },
    del_id:{ type: String },
    email: { type: String },
    address: { type: String },
    Phone_no: { type: String },
    password: { type: String },
    
    
})

const deliveryboyModel = mongoose.model('deliveryboy_tb',deliveryboySchema)
module.exports = deliveryboyModel