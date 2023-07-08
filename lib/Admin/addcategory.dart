import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class addcategory extends StatefulWidget {
  @override
  _addcategoryState createState() => _addcategoryState();
}

class _addcategoryState extends State<addcategory> {
  File? _image;
  final picker = ImagePicker();
  TextEditingController _textEditingController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, submit your data
      // Add your code to handle form submission here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField and Image Picker'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // Add padding around the search bar
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  // Use a Material design search bar
                  child: TextFormField(
                    controller: _textEditingController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a product name';
                      }
                      return null; // Return null if the input is valid
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Product Name',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _image != null
                  ? Image.file(
                _image!,
                width: 200,
                height: 200,
              )
                  : Text('No image selected'),
              ElevatedButton(
                onPressed: getImage,
                child: Text('Pick Image'),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: addcategory()));
}
