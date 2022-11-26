import 'package:flutter/material.dart';
import 'package:mentor/utils/custom_colors.dart';
import 'package:mentor/utils/custom_decoration.dart';
import 'package:mentor/utils/custom_text_style.dart';
import 'package:mentor/widgets/custom_graident_button.dart';
import 'package:mentor/widgets/custom_sign_row_button.dart';
import 'package:mentor/widgets/logo_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late String email, password;
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
            CustomGraidentButton(onPressed: () {}, buttonText: "Kayıt Ol"),
            doHaveAnAccount()
          ],
        ),
      ),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.length < 6) {
          return "En Az 6 Karakter Giriniz";
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
        if (value!.length < 6) {
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
        } else if (_textEditingController.text == value) {
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

  CustomSignRowButton doHaveAnAccount() {
    return CustomSignRowButton(
      onPressed: () {},
      text: "Zaten Bir Hesabın mı Var?",
      buttonText: "Giriş Yap",
    );
  }
}
