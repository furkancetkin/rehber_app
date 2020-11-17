import 'package:flutter/material.dart';
import 'package:rehber_app/contact.dart';

class AddContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Contact"),
      ),
      body: AddContactForm(),
    );
  }
}

class AddContactForm extends StatefulWidget {
  @override
  _AddContactFormState createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Contact Name"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Name required";
                  }
                },
                onSaved: (value) {
                  name = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: "Phone Number"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Phone Number required";
                  }
                },
                onSaved: (value) {
                  phoneNumber = value;
                },
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Submit"),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  Contact.contacts.add(Contact(name, phoneNumber));

                  var snackBar = Scaffold.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text("$name has been saved"),
                  ));

                  snackBar.closed.then((value) => Navigator.pop(context));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
