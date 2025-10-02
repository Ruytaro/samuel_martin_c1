import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/widgets/buttons.dart';
import 'package:samuel_martin_c1/widgets/drawer.dart';
import 'package:samuel_martin_c1/widgets/padding.dart';
import '../services/user_manager.dart';
import '../utils/notifications.dart';
import 'profile.dart';
import 'register.dart';
import '../widgets/forms.dart';
import 'dart:collection';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class LoginScreenState extends State<LoginScreen> {
  final Map<String, String> _values = HashMap();
  var _verified = false;
  final _formKey = GlobalKey<FormState>();

  void _loadRegisterScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }

  @override
  void initState() {
    super.initState();
    UserManager().register("admin", "admin");
  }

  void checkLogin() {
    _verified = true;
    if (_formKey.currentState!.validate()) {
      if (UserManager().authenticate(
        _values["Username"]!,
        _values["Password"]!,
      )) {
        Notifications.showMessage(context, "Login successful");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Profile()),
        );
      } else {
        Notifications.showError(context, "Invalid username or password");
      }
    } else {
      Notifications.showError(context, "Fill all the missing fields");
    }
  }

  void updateCallback(String label, String value) {
    _values[label] = value;
    if (_verified) {
      _formKey.currentState!.validate();
    }
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
      drawer: MyDrawer(),
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
              myFormField(updateCallback, "Username"),
              myFormField(updateCallback, "Password", obscure: true),
              edgePadding(myElevatedButton(checkLogin, Text("Login"))),
              edgePadding(myElevatedButton(_loadRegisterScreen, Text('Register'))),
            ],
          ),
        ),
      ),
    );
  }
}
