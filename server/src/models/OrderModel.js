const mongoose = require("mongoose");

const schema = mongoose.Schema

const orderSchema = new schema({
    user_id: { type: mongoose.Types.ObjectId,ref:'user_tb' },
    
    product_id: { type: mongoose.Types.ObjectId,ref:'product_tb' },

    quantity: { type: String },
    price: { type: String },
    total: { type: String },
    totalValue: { type: String },

    status: { type: String },
    
    
})

const orderModel = mongoose.model('order_tb',orderSchema)
module.exports = orderModel