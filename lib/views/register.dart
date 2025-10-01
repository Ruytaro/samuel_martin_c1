import 'package:flutter/material.dart';
import 'package:samuel_martin_c1/utils/notifications.dart';
import 'package:samuel_martin_c1/widgets/padding.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';
import '../services/image.dart';
import '../utils/validators.dart';
import 'dart:collection';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Map<String, String> _values = HashMap();
  bool _verified = false;
  final _formKey = GlobalKey<FormState>();
  String? avatarPath;
  final _galleryPicker = GalleryService();
  final _value = "title";

  void createUser() {
    _verified = true;
    if (!_formKey.currentState!.validate()) {
      Notifications.showError(context, "Review the form");
    }
  }

  void updateCallback(String label, String value) {
    _values[label] = value;
    if (_verified) {
      _formKey.currentState!.validate();
    }
  }

  void uploadAvatar() async {
    final path = await _galleryPicker.selectPhoto();
    if (path == null) return;
    setState(() {
      avatarPath = path;
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: RadioGroup(
                  onChanged: (value) => {},
                  groupValue: _value,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Pronoum: "),
                      SizedBox.fromSize(size: const Size(40, 0)),
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
              myFormField(updateCallback, "Username"),
              myFormField(
                updateCallback,
                "Password",
                obscure: true,
                validator: validateStrongPassword,
              ),
              TextFormField(
                onChanged: (value) => updateCallback("Password2", value),
                validator: (value) => isEqualTo(value!, _values["Password"]),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Retype password",
                  border: OutlineInputBorder(),
                  constraints: BoxConstraints(maxWidth: 300),
                ),
              ),
              if (avatarPath == null)
                edgePadding(
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Set avatar"),
                      myElevatedButton(uploadAvatar, Text("Upload")),
                    ],
                  ),
                )
              else
                edgePadding(Image.network(avatarPath!)),
              myElevatedButton(createUser, Text('Create account')),
            ],
          ),
        ),
      ),
    );
  }
}
