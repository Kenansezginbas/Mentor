import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentor/model/service/auth_service.dart';
import 'package:mentor/utils/custom_colors.dart';
import 'package:mentor/utils/custom_decoration.dart';
import 'package:mentor/utils/custom_dialogs.dart';
import 'package:mentor/utils/custom_text_style.dart';
import 'package:mentor/widgets/buttons/custom_graident_button.dart';
import 'package:mentor/widgets/buttons/custom_sign_row_button.dart';
import 'package:mentor/widgets/rows/logo_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late String email, password;
  TextEditingController _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
              passwordControllTextField(),
              const SizedBox(height: 10),
              CustomGraidentButton(
                onPressed: formValidateAndSave,
                buttonText: "Kayıt Ol",
              ),
              doHaveAndAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  void formValidateAndSave() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      signUp();
    }
  }

  Future signUp() async {
    final authService = AuthService();
    final customDialog = CustomDialog();
    try {
      final resultAuth = await authService.signUp(email, password);
      if (resultAuth == "success") {
        print("Basarili");
      } else {
        customDialog.showCustomCupertinoDialog(
            context, "Hata", resultAuth.toString());
      }
    } catch (e) {}
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
      style: CustomTextStyle.titleWhiteTextStyle,
      cursorColor: CustomColors.yellowColor,
      decoration: CustomDecoration().textFieldDecoration("Email"),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "En Az 6 Karakter Giriniz";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        password = value!;
      },
      controller: _textEditingController,
      obscureText: true,
      style: CustomTextStyle.titleWhiteTextStyle,
      cursorColor: CustomColors.yellowColor,
      decoration: CustomDecoration().textFieldDecoration("Şifre"),
    );
  }

  TextFormField passwordControllTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.length < 6) {
          return "En Az 6 Karakter Giriniz";
        } else if (_textEditingController.text != value) {
          return "Şifreler Uyuşmuyor";
        } else {
          return null;
        }
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      style: CustomTextStyle.titleWhiteTextStyle,
      cursorColor: CustomColors.yellowColor,
      decoration: CustomDecoration().textFieldDecoration("Şifre (Tekrar)"),
    );
  }

  CustomSignRowButton doHaveAndAccount(BuildContext context) {
    return CustomSignRowButton(
      onPressed: () => Navigator.pushNamedAndRemoveUntil(
          context, "/signIn", (route) => false),
      text: "Zaten Bir Hesabın mı Var?",
      buttonText: "Giriş Yap",
    );
  }
}
