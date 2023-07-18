const express = require('express');
const cartModel = require('../models/CartModel');
const productModel = require('../models/ProductModel');


const cartRouter = express.Router();
cartRouter.get('/view_cart/:id', async (req, res) => {
  try {
      const id = req.params.id
      console.log(id);
      // const data = await cartModel.find({ user_id: id, status: 0 })
      const data = await cartModel.aggregate([
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
                  'product_name': { '$first': '$product.productname' },
                  'description': { '$first': '$product.description' },
                  'product_image': { '$first': '$product.product_image' },
                  'price': { '$first': '$product.price' },

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

          })
      }

  } catch (error) {
      return res.status(400).json({
          success: false,
          error: true,
          message: "Something went wrong"
      })
  }
})
cartRouter.get('/increment/:id', async (req, res) => {
  try {
      const id = req.params.id
      const old = await cartModel.findOne({ _id: id })
      console.log(old);
      const counts = old.quantity + 1

      const add = await cartModel.updateOne({ _id: id }, { $set: { quantity: counts } })

      if (add.modifiedCount === 1) {
          const old_product = await productModel.findOne({ _id: old.product_id })
          const available_counts = old_product.quantity + 1
          const product = await productModel.updateOne({ _id: old.product_id }, { $set: { quantity: available_counts } })

          return res.status(201).json({
              success: true, error: false,
              message: "updated"
          })
      } else {
          return res.status(400).json({
              success: false, error: true,
              message: "error"
          })
      }
  }
  catch (err) {
      res.status(500).json({ success: false, error: true, message: 'Something Went Wrong' })
      console.log(err)
  }
})

cartRouter.get('/decrement/:id', async (req, res) => {
  try {
      const id = req.params.id
      const old = await cartModel.findOne({ _id: id })
      if (old.quantity > 1) {
          const counts = old.quantity - 1

          const add = await cartModel.updateOne({ _id: id }, { $set: { quantity: counts } })

          if (add.modifiedCount === 1) {
              const old_product = await productModel.findOne({ _id: old.product_id })
              const available_counts = old_product.quantity - 1
              const products = await productModel.updateOne({ _id: old.product_id }, { $set: { quantity: available_counts } })

              return res.status(201).json({
                  success: true, error: false,
                  message: "updated"
              })
          } else {
              return res.status(400).json({
                  success: false, error: true,
                  message: "error"
              })
          }
      } else {
          return res.status(400).json({
              success: false, error: true,
              message: "Quantity cannot be less than 1"
          })
      }

  }
  catch (err) {
      res.status(500).json({ success: false, error: true, message: 'Something Went Wrong' })
      console.log(err)
  }
})

cartRouter.get('/delete_cart/:id', async (req, res) => {
  const id = req.params.id
  try {
      cart.deleteOne({ _id: id }).then((data) => {
          if (data.deletedCount === 1) {
              return res.status(200).json({
                  success: true,
                  error: false,
                  message: "Data Deleted From Cart"
              })
          }
      })

  } catch (error) {
      return res.status(400).json({
          success: false,
          error: true,
          message: "Something went wrong"
      })
  }
})

cartRouter.post('/cart', async (req, res) => {
    console.log(req.body);
    try {
        const old = await cartModel.findOne({ user_id: req.body.user_id, product_id: req.body.product_id, status: 0 })
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
        var result = await cartModel(data).save()

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




module.exports = cartRouter;