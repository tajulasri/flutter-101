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

  _validate(field, value) {
    return value == null || value.isEmpty ? "$field is required." : null;
  }

  _addContact() {
    if (_formKey.currentState!.validate()) {
      print("validated");
    }

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
                TextFormField(
                  validator: (value) => _validate('Name', value),
                  autocorrect: false,
                  obscureText: false,
                  controller: _nameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_box,
                    ),
                    labelText: "Name",
                  ),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => _validate('Mobile', value),
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  controller: _mobileController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.call_rounded,
                    ),
                    labelText: "Mobile",
                  ),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _addContact(),
                    child: const Text("Add to contact"),
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
