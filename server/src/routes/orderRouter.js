const express = require('express');

const orderModel = require('../models/orderModel');
const orderRouter = express.Router();
orderRouter.get('/view-product/:id', async (req, res) => {
  try {
    const id = req.params.id
      const users = await orderModel.find({user_id:id})
      if(users[0]!=undefined){
          return res.status(200).json({
              success:true,
              error:false,
              data:users
          })
      }else{
          return res.status(400).json({
              success:false,
              error:true,
              message:"No data found"
          })
      }
  } catch (error) {
      return res.status(400).json({
          success:false,
          error:true,
          message:"Something went wrong",
          details:error
      })
  }
  })
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
