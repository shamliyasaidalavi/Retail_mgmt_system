const mongoose = require("mongoose");

const schema = mongoose.Schema

const offerSchema = new schema({
    offer_name: { type: String },
    offer_id: { type: String },
    quantity: { type: String },
    price: { type: String },
    offer_image: { type: String },
    
})

const offerModel = mongoose.model('offer_tb',offerSchema)
module.exports = offerModel