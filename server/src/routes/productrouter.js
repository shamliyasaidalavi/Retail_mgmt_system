const express = require('express');
const loginModel = require('../models/loginModel');
const productModel = require('../models/ProductModel');
const productRouter = express.Router();
productRouter.get('/view-product', async (req, res) => {
  try {
      const users = await productModel.find()
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
productRouter.post('/product', async function (req, res) {
  try {
    const data = {
        product_name: req.body. product_name ,
        quantity: req.body.quantity,
        price: req.body.price,
        description: req.body.description,
        category: req.body.category, 
      
    };
    const datas = await productModel(data).save()
    console.log(datas);
    if (datas) {
      return res.status(200).json({
          success: true,
          error: false,
          details: datas,
          message: "item added completed"
      })
  }
    
  } catch (error) {
    return res.status(400).json({
      success: false,
      error: true,
      message: "somethig wet wrog"
  })
  }
});

module.exports = productRouter;
