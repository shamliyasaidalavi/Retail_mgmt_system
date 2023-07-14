const express = require('express');
const cartModel = require('../models/CartModel');
const orderModel = require('../models/orderModel');


const cartRouter = express.Router();
cartRouter.get('/view-product/:id', async (req, res) => {
  try {
    const id = req.params.id
      const users = await cartModel.find({user_id:id})
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

cartRouter.post('/cart/:', async function (req, res) {
  try {
    const data = {
        
         product_id: req.body.product_id,
        quantity: req.body.quantity,
       user_id:req.body.user_id,
       status:0,
       quantity:1,
      
    };
    const datas = await cartModel(data).save()
    
    console.log(data);
    
  } catch (error) {
    
  }
});
cartRouter.post('/cart', async (req, res) => {
    try {
        const old = await cart.findOne({ user_id: req.body.user_id, product_id: req.body.product_id, status: 0 })
        if (old) {
            return res.status(400).json({
                success: false,
                error: true,
                message: "Product already in cart"
            })
        }
        const data = {
            user_id: req.body.user_id,
            product_id: req.body.product_id,
            quantity: 1,
            status: 0
        }
        console.log(data);
        var result = await cart(data).save()

        if (result) {
            return res.status(200).json({
                success: true,
                error: false,
                data: result,
                message: "Added to Cart"
            })
        }

    } catch (err) {
        return res.status(400).json({
            success: false,
            error: true,
            message: "Something went wrong"
        })
    }
})

cartRouter.post('/delete-single-product/:id', async function (req, res) { 
  try {
      const productId = req.params.id; 
    
      const product = await orderModel.deleteOne({_id:productId})

      if (product.deletedCount!=1) { 
          return res.status(400).json({
              success: false,
              error: true,
              message: "Data not deleted"
          });
      }

      return res.status(200).json({
          success: true,
          error: false,
          data: product,
          message:"Data deleted"
      });

  } catch (error) {
      return res.status(400).json({
          success: false,
          error: true,
          message: "Something went wrong"
      });
  }
});

module.exports = cartRouter;
