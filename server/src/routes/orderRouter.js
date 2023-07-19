const express = require('express');
const orderModel = require('../models/OrderModel');

const orderRouter = express.Router();


orderRouter.get('/view_order/:id', async (req, res) => {
  try {
      const id = req.params.id
      console.log(id);
      // const data = await ordermodel.find({ user_id: id, status: 0 })
      const data = await orderModel.aggregate([
          {
              '$lookup': {
                  'from': 'product_tbs',
                  'localField': 'product_id',
                  'foreignField': '_id',
                  'as': 'product'
              }
          },
          {
              "$unwind": "$product"
          },
          {
              "$match": {
                  "user_id": new objectId(id)
              }
          },
          {
              "$match": {
                  "status": "0"
              }
          },
          {
              "$group": {
                  '_id': '$_id',
                  'quantity': { '$first': '$quantity' },
                  'status': { '$first': '$status' },
                  'product_id': { '$first': '$product.product_id' },
                  'user_id' : {'$first':'$user.user_id' }
              }
          }
      ])

      data.forEach((item) => {
          item.total = item.price * item.quantity;
      });

      let totalValue = 0;

      for (const item of data) {
          totalValue += item.total;
      }

      data.forEach((item) => {
          item.total_amount = totalValue;
      });

      if (data[0] === undefined) {
          return res.status(401).json({
              success: false,
              error: true,
              message: "No Data Found!"
          })
      }
      else {
          return res.status(200).json({
              success: true,
              error: false,
              data: data,
              totalValue:totalValue
          })
      }

  } catch (error) {
      return res.status(400).json({
          success: false,
          error: true,
          message: "Something went wrongzz"
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
