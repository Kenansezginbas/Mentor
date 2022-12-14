import 'package:flutter/material.dart';
import 'package:mentor/service/auth/auth_service.dart';
import 'package:mentor/utils/ui/widgets/buttons/custom_graident_button.dart';
import 'package:mentor/utils/ui/widgets/buttons/custom_sign_row_button.dart';
import 'package:mentor/utils/ui/widgets/rows/logo_widget.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;

import '../../config/themes/color_manager.dart';
import '../../config/themes/custom_decoration.dart';
import '../../config/themes/custom_dialogs.dart';
import '../../config/themes/style_manager.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late String email, password;
  final _formKey = GlobalKey<FormState>();
  final authService = AuthService();
  final dialog = CustomDialog();
  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LogoWidget(),
              const SizedBox(height: 50),
              emailTextField(),
              const SizedBox(height: 10),
              passwordTextField(),
              const SizedBox(height: 10),
              CustomGraidentButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final result = await authService.signIn(email, password);
                      if (result == "success") {
                      } else {
                        // ignore: use_build_context_synchronously
                        dialog.showCustomDialog(
                            context, "Hata", result.toString());
                      }
                    }
                  },
                  buttonText: "Giri?? Yap"),
              dontHaveAnAccount(context)
            ],
          ),
        ),
      ),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.length < 6) {
          return "Lutfen Mail Adresinizi Giriniz.";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        email = value!;
      },
      keyboardType: TextInputType.emailAddress,
      style: StyleManager.titleWhiteTextStyle,
      cursorColor: ColorManager.yellowColor,
      decoration: CustomDecoration().textFieldDecoration("Email"),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.length < 6) {
          return "En Az 6 Karakter Giriniz";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      style: StyleManager.titleWhiteTextStyle,
      cursorColor: ColorManager.yellowColor,
      decoration: CustomDecoration().textFieldDecoration("??ifre"),
    );
  }

  CustomSignRowButton dontHaveAnAccount(BuildContext context) {
    return CustomSignRowButton(
      onPressed: () => Navigator.pushNamedAndRemoveUntil(
          context, "/signUp", (route) => false),
      text: "Hesab??n Yok mu ?",
      buttonText: "Kay??t Ol",
    );
  }
}
