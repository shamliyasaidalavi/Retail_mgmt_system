const express = require('express');
const categoryModel = require('../models/category');

const categoryRouter = express.Router();
categoryRouter.get('/view-category', async (req, res) => {
    try {
        const users = await categoryModel.find()
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
categoryRouter.post('/category', async function (req, res) {
  try {
    const data = {
      category_name: req.body.order_name,
    };
    const savedData = await categoryModel(data).save();
    console.log(savedData);
  } catch (error) {
    console.error(error);
  }
});

module.exports = categoryRouter;
