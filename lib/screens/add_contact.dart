import 'package:asset_kktm/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddContactScreen extends StatelessWidget {
  AddContactScreen({Key? key}) : super(key: key);

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _mobileController = new TextEditingController();
  TextEditingController _workController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _validate(field, value) {
    return value == null || value.isEmpty ? "$field is required." : null;
  }

  _addContact(widgetContext, providerContact) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(widgetContext).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
          content: Text(
            "Contact added",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (_nameController.text != "" && _mobileController.text != "") {}
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
                    onPressed: () {
                      context.read<DashboardProvider>().addContact(
                            _nameController.text,
                            _mobileController.text,
                          );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.green,
                          content: Text(
                            "Contact added",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );

                      Navigator.pop(context);
                    },
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
