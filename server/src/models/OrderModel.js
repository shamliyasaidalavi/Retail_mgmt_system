const mongoose = require("mongoose");

const schema = mongoose.Schema

const orderSchema = new schema({
    order_name: { type: String },
    order_id: { type: String },
    quantity: { type: String },
    price: { type: String },
    date: { type: String },
    
    
})

const orderModel = mongoose.model('order_tb',orderSchema)
module.exports = orderModel