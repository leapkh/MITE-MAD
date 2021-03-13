import 'package:flutter/material.dart';
import 'package:miteapp/model/user.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<AccountScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  User _user;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      // Show login form
      return _loginWidget;
    } else {
      // Show profile
      return _profileWidget;
    }
  }

  Widget get _loginWidget {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(onPressed: _onLogInButtonClick, child: Text('Log In'))
        ],
      ),
    );
  }

  Widget get _profileWidget {
    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.network(
        _user.profileImageUrl,
        width: 100,
        height: 100,
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        imageWidget,
        Text(_user.firstName + ' ' + _user.lastName),
        Text(_user.email),
        ListTile(
          title: Text('My Orders'),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          title: Text('My Favorite'),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          onTap: _onLogOutClick,
          title: Text('Log Out'),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ],
    );
  }

  void _onLogInButtonClick() {
    final email = _emailController.text;
    final password = _passwordController.text;
    // Sign in success
    setState(() {
      _user = User(
          1,
          'Sok',
          'Sao',
          'https://rupp-ite.s3-ap-southeast-1.amazonaws.com/sok-sao.jpg',
          email);
    });
  }

  void _onLogOutClick() {
    // Confirm log out
    final dialog = AlertDialog(
      title: Text('Confirm Logout'),
      content: Text('Do you want to log out?'),
      actions: [
        TextButton(onPressed: _onCancelLogOutClick, child: Text('No')),
        ElevatedButton(onPressed: _onConfirmLogOutClick, child: Text('Yes'))
      ],
    );
    showDialog(
      context: context,
      builder: (context) {
        return dialog;
      },
    );
  }

  void _onCancelLogOutClick() {
    Navigator.pop(context);
  }

  void _onConfirmLogOutClick() {
    Navigator.pop(context);
    setState(() {
      _user = null;
    });
  }
}
