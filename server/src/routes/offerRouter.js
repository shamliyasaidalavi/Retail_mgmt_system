const express = require('express');
const offerModel = require('../models/offerModel');
const offerRouter = express.Router();

offerRouter.post('/offer', async function (req, res) {
  try {
    const data = {
        offer_name: req.body. offer_name ,
        offer_id: req.body. offer_id,
        quantity: req.body. quantity,
        price: req.body. price,
        offer_image: req.body. offer_image,
      
    };
    const datas = await offerModel(data).save()
    console.log(data);
    
  } catch (error) {
    
  }
});

module.exports = offerRouter;
