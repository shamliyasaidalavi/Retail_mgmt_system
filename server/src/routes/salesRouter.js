const express = require('express');
const salesModel = require('../models/SalesModel');


const salesRouter = express.Router();

salesRouter.post('/payment', async function (req, res) {
  try {
    const data = {
        product_name: req.body. product_name ,
        order_id: req.body.order_id,
        quantity: req.body.quantity,
        price: req.body.price,
        item: req.body.item,
        date: req.body.date, 
       
      
    };
    const datas = await salesModel(data).save()
    console.log(data);
    
  } catch (error) {
    
  }
});

module.exports = salesModel;
