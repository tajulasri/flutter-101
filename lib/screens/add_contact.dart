import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  AddContactScreen({Key? key}) : super(key: key);

  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _mobileController = new TextEditingController();
  TextEditingController _workController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _addContact() {
    if (_nameController.text != "" && _mobileController.text != "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
          content: Text(
            "Contact is saved",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextField(
                  autocorrect: false,
                  obscureText: false,
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_box,
                    ),
                    labelText: "Name",
                  ),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  controller: _mobileController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.call_rounded,
                    ),
                    labelText: "Mobile",
                  ),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _addContact(),
                    child: Text("Add to contact"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
