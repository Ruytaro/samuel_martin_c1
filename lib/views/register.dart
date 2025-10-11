import 'package:flutter/material.dart';
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
  String? avatar;
  final _galleryPicker = GalleryService();
  String _province = 'Huesca';
  String _pronoum = 'He';
  void createUser() {
    _verified = true;
    if (!_formKey.currentState!.validate()) {
      Notifications.showError(context, "Review the form");
    }
    if (UserManager().register(
      User(
        _values['Username']!,
        _values['Password']!,
        pronoum: _pronoum,
        province: _province,
        age: int.parse(_values['Age']!),
        avatar: avatar!,
      ),
    )) {
      Notifications.showMessage(context, "User created succesfully");
      Navigator.pop(context);
    } else {
      Notifications.showError(context, "User already exists");
    }
  }

  void updateCallback(String label, String value) {
    _values[label] = value;
    if (_verified) {
      _formKey.currentState!.validate();
    }
  }

  void _uploadAvatar() async {
    final photo = await _galleryPicker.selectPhoto();
    if (photo == null) return;
    setState(() {
      avatar = photo;
    });
  }

  void _takePhoto() async {
    final photo = await _galleryPicker.takePhoto();
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
                  groupValue: _pronoum,
                  onChanged: (String? value) {
                    setState(() {
                      _pronoum = value!;
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
                  : edgePadding(
                      Image.asset('assets/images/avatar.png', width: 150),
                    ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  edgePadding(
                    myElevatedButton(_uploadAvatar, Text("Upload avatar")),
                  ),
                  edgePadding(myElevatedButton(_takePhoto, Text("Take Photo"))),
                ],
              ),

              myFormField(updateCallback, "Age", validator: validateNumber),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  edgePadding(Text('Province:')),
                  DropdownButton<String>(
                    value: _province,
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
                          _province = value;
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
