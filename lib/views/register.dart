import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:samuel_martin_c1/models/user.dart';
import 'package:samuel_martin_c1/services/user_manager.dart';
import 'package:samuel_martin_c1/widgets/images.dart';
import '../utils/notifications.dart';
import '../widgets/padding.dart';
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
  XFile? avatar;
  final _galleryPicker = GalleryService();

  void createUser() {
    _verified = true;
    if (!_formKey.currentState!.validate()) {
      Notifications.showError(context, "Review the form");
    }
    UserManager().register(
      User(
        username: _values['Username']!,
        password: _values['Password']!,
        age: int.tryParse(_values['Age']!),
        avatar: avatar!,
      ),
    );
    Notifications.showMessage(context, "User created succesfully");
  }

  void updateCallback(String label, String value) {
    _values[label] = value;
    if (_verified) {
      _formKey.currentState!.validate();
    }
  }

  void uploadAvatar() async {
    final photo = await _galleryPicker.selectPhoto();
    if (photo == null) return;
    setState(() {
      avatar = photo;
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
                child: RadioGroup<String>(
                  groupValue: _values['pronoum'],
                  onChanged: (String? value) {
                    setState(() {
                      _values['pronoum'] = value!;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      edgePadding(Text("Pronoum")),
                      SizedBox(width: 10),
                      leftPadding(Text("He")),
                      Radio(value: "He"),
                      leftPadding(Text("She")),
                      Radio(value: "She"),
                      leftPadding(Text("They")),
                      Radio(value: "They"),
                      leftPadding(Text("Any")),
                      Radio(value: "Any"),
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
              edgePadding(
                TextFormField(
                  onChanged: (value) => updateCallback("Password2", value),
                  validator: (value) => isEqualTo(_values["Password"], value),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Retype password",
                    border: OutlineInputBorder(),
                    constraints: BoxConstraints(maxWidth: 300),
                  ),
                ),
              ),
              (avatar != null)
                  ? edgePadding(myImageFile(avatar!, 150))
                  : edgePadding(myImageAsset('images/avatar.png', 150)),
              edgePadding(
                myElevatedButton(uploadAvatar, Text("Upload avatar")),
              ),
              myFormField(updateCallback, "Age", validator: validateNumber),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Province:'),
                  DropdownButton<String>(
                    value: _values['province'],
                    items: <String>['Huesca', 'Teruel', 'Zaragoza'].map((
                      String province,
                    ) {
                      return DropdownMenuItem<String>(
                        value: province,
                        child: Text(province),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() {
                          _values['province'] = value;
                        });
                      }
                    },
                  ),
                ],
              ),
              myElevatedButton(createUser, Text('Create account')),
            ],
          ),
        ),
      ),
    );
  }
}
