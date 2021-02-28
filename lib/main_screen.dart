import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MainScreen> {
  bool isCheckboxChecked = false;

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget get appBar {
    return AppBar(
      title: Text('Bottom Navigation'),
    );
  }

  Widget get body {
    return Center(
        child: Checkbox(
      onChanged: (state) {
        print('change state');
        setState(() {
          isCheckboxChecked = !isCheckboxChecked;
        });
      },
      value: isCheckboxChecked,
    ));
  }

  Widget get bottomNavigationBar {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Group'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.facebookF), label: 'Social'),
      ],
    );
  }
}
