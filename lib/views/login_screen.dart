import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/utils/validators.dart';
import '../services/user_manager.dart';
import '../utils/notifications.dart';
import 'profile.dart';
import 'register.dart';
import '../widgets/forms.dart';
import 'dart:collection';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() =>LoginScreenState();
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class LoginScreenState extends State<LoginScreen> {
  final Map<String, String> _values = HashMap(); 

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    UserManager().register("admin", "admin");
  }

  void checkLogin() {
    if (_formKey.currentState!.validate()) {
      if (UserManager().authenticate(_values["Username"]!, _values["Password"]!)) {
      Notifications.showMessage(context, "Login successful");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Profile()),
        );
      } else {
        Notifications.showError(context, "Invalid username or password");
      }
    } else {
      Notifications.showError(context, "Error in the form");
    }
  }

  void updateCallback(String label, String value) {
    _values[label]=value;
    _formKey.currentState!.validate();
    print('field $label has value $value');
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme.copyWith(
      titleLarge: theme.textTheme.titleLarge?.copyWith(
        color: colorScheme.onPrimary,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text('Login Screen', style: textTheme.titleLarge),
        ),
        backgroundColor: colorScheme.primary,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('images/logo.png', width: 300, height: 300),
              ),
              buildFormField(validateNotEmpty,updateCallback,"Username"),
              buildFormField(validateNotEmpty,updateCallback,"Password", obscure: true),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  onPressed: checkLogin,
                  child: Text('Login'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
                  child: Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
