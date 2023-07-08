const express = require('express');

const orderModel = require('../models/orderModel');
const orderRouter = express.Router();

orderRouter.post('/order', async function (req, res) {
  try {
    const data = {
        order_name: req.body. order_name ,
        order_id: req.body.order_id,
        quantity: req.body.quantity,
        price: req.body.price,
        date: req.body.date, 
       
      
    };
    const datas = await orderModel(data).save()
    console.log(data);
    
  } catch (error) {
    
  }
});

module.exports = orderRouter;
