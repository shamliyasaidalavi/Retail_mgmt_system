const express = require('express');
const cartModel = require('../models/CartModel');

const cartRouter = express.Router();

// View cart products for a specific user
cartRouter.get('/view-product/:id', async (req, res) => {
  try {
    const id = req.params.id;
    const cartProducts = await cartModel.find({ user_id: id });

    if (cartProducts.length > 0) {
      return res.status(200).json({
        success: true,
        error: false,
        data: cartProducts
      });
    } else {
      return res.status(400).json({
        success: false,
        error: true,
        message: "No data found"
      });
    }
  } catch (error) {
    return res.status(500).json({
      success: false,
      error: true,
      message: "Something went wrong",
      details: error
    });
  }
});

// Add a product to the cart
cartRouter.post('/cart', async (req, res) => {
  try {
    const data = {
      user_id: req.body.user_id,
      product_id: req.body.product_id,
      quantity: 1,
      status: 0
    };

    const cartItem = await cartModel.findOne({
      user_id: data.user_id,
      product_id: data.product_id,
      status: 0
    });

    if (cartItem) {
      return res.status(400).json({
        success: false,
        error: true,
        message: "Product already in cart"
      });
    }

    const result = await cartModel.create(data);

    if (result) {
      return res.status(200).json({
        success: true,
        error: false,
        data: result,
        message: "Added to Cart"
      });
    }
  } catch (err) {
    return res.status(500).json({
      success: false,
      error: true,
      message: "Something went wrong",
      details: err
    });
  }
});

// Delete a single product from the cart
cartRouter.post('/delete-single-product/:id', async function (req, res) { 
  try {
    const productId = req.params.id; 
    
    const deletedProduct = await cartModel.findByIdAndDelete(productId);

    if (!deletedProduct) { 
      return res.status(400).json({
        success: false,
        error: true,
        message: "Data not deleted or not found"
      });
    }

    return res.status(200).json({
      success: true,
      error: false,
      data: deletedProduct,
      message: "Data deleted"
    });

  } catch (error) {
    return res.status(500).json({
      success: false,
      error: true,
      message: "Something went wrong",
      details: error
    });
  }
});

module.exports = cartRouter;
