import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});
  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text('This is a SnackBar'),
                      action: SnackBarAction(
                        label: 'Save',
                        onPressed: () {
                          // Handle save action
                        },
                      ),
                    ),
                  );
                  // Handle save action
                },
                child: Text('Open SnackBar'),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('This is an AlertDialog'),
                        title: Text('AlertDialog Title'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Open SnackBar'),
              ),
              DropdownButton(
                value: menuItem,
                hint: Text('Select an element'),
                isExpanded: true,
                items: [
                  DropdownMenuItem(value: 'e1', child: Text('Element 1')),
                  DropdownMenuItem(value: 'e2', child: Text('Element 2')),
                  DropdownMenuItem(value: 'e3', child: Text('Element 3')),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () {
                  FocusScope.of(context).nextFocus();
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              Checkbox(
                value: isChecked,
                tristate: true,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),

              CheckboxListTile.adaptive(
                tristate: true,
                value: isChecked,
                title: Text('Click me '),
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),

              Text('I agree to the terms and conditions'),
              SizedBox(height: 20),

              Switch(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),

              SwitchListTile.adaptive(
                value: isSwitched,
                title: Text('Click me'),
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              Slider.adaptive(
                value: sliderValue,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
                min: 0,
                max: 1,
                divisions: 10,
              ),

              InkWell(
                splashColor: Colors.teal,
                onTap: () => print('Image tapped'),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => print('Image tapped'),
                child: Image.asset('assets/images/fluimage.jpg'),
              ),

              FilledButton(onPressed: () {}, child: Text('Filled Button')),

              TextButton(onPressed: () {}, child: Text('Text Button')),

              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text('Outlined Button'),
              ),

              CloseButton(),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}
