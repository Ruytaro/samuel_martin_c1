import 'package:flutter/material.dart';
import '../services/user_manager.dart';
import '../utils/notifications.dart';
import 'profile.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class LoginScreenState extends State<LoginScreen> {
  String? _user;
  String? _pass;

  @override
  Widget build(BuildContext context) {
      final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme.copyWith(
      titleLarge: theme.textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary),
    );

    return Scaffold(
      appBar: AppBar(title: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text('Login Screen',style: textTheme.titleLarge,),
      ),backgroundColor: colorScheme.primary),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/logo.png', width: 300, height: 300),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                onChanged: (value) => _user = value,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  constraints: BoxConstraints(maxWidth: 300),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                onChanged: (value) => _pass = value,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  constraints: BoxConstraints(maxWidth: 300),
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: () {
                  if (UserManager().login(_user ?? '', _pass ?? '')) {
                    Notifications.showMessage(context,'Login successful');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
                  } else {
                    Notifications.showError(context, "Error: Invalid credentials");
                  }
                },
                child: Text('Login'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                },
                child: Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
