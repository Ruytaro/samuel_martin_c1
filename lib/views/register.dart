import 'package:flutter/material.dart';
import '../widgets/forms.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? _title;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme.copyWith(
      titleLarge: theme.textTheme.titleLarge?.copyWith(
        color: colorScheme.onPrimary,
      ),
    );

    void setTitle(String? value) {
      setState(() {
        _title = value;
        print(_title);
      });
    }

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
                  groupValue: _title,
                  onChanged: setTitle,
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
                child: buildFormField("Username"),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: buildFormField("Password",obscure: true),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: buildFormField("Retype password",obscure: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
