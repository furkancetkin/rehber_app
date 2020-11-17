import 'package:flutter/material.dart';
import 'package:rehber_app/add_contact_page.dart';
import 'package:rehber_app/contact.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Contact> contacts = Contact.contacts;
  @override
  void initState() {
    contacts = Contact.contacts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Contact.contacts
        .sort((Contact a, Contact b) => a.name[0].compareTo(b.name[0]));
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Rehber",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddContactPage()));
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (BuildContext context, int index) {
              Contact contact = contacts[index];
              return Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/palette.jpg'),
                      child: Text(
                        contact.name[0],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contact.name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            contact.phoneNumber,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(
                              height: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
