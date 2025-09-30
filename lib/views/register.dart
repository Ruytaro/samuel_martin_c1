import 'package:flutter/material.dart';
import '../widgets/forms.dart';
import '../utils/validators.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? _title;
  String? _user;
  String? _pass;
  String? _repass;

  void updateCallback(String label, String? value) {
    setState(() {
      switch (label) {
        case "Username":
          _user = value;
          break;
        case "Password":
          _pass = value;
          break;
        case "Retype password":
          _repass = value;
          break;
        default:
      }
    });
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
        title: Text('Register', style: textTheme.titleLarge),
        backgroundColor: colorScheme.primary,
      ),
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: RadioGroup(
                  onChanged: (value) => setState(() {
                    _title = value;
                  }),
                  groupValue: _title,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Pronoum: "),
                      SizedBox.fromSize(size: const Size(50, 0)),
                      Text("He"),
                      Radio(value: 'He'),
                      SizedBox.fromSize(size: const Size(10, 0)),
                      Text("She"),
                      Radio(value: 'She'),
                      SizedBox.fromSize(size: const Size(10, 0)),
                      Text("They"),
                      Radio(value: 'They'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: buildFormField(validateNotEmpty,updateCallback, "Username"),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: buildFormField(validateNotEmpty,updateCallback, "Password", obscure: true),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: buildFormField(
                  validateNotEmpty,updateCallback,
                  "Retype password",
                  obscure: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
