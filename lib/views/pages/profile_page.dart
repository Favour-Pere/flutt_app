import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            ElevatedButton(
              onPressed: () {
                // Handle save action
              },
              child: Text('Save'),
            ),

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

            GestureDetector(
              onTap: () => print('Image tapped'),
              child: Image.asset('assets/images/fluimage.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
