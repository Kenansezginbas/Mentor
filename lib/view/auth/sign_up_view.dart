import 'package:flutter/material.dart';
import 'package:mentor/service/auth/auth_service.dart';
import 'package:mentor/utils/ui/widgets/buttons/custom_graident_button.dart';
import 'package:mentor/utils/ui/widgets/buttons/custom_sign_row_button.dart';
import 'package:mentor/utils/ui/widgets/rows/logo_widget.dart';
import '../../config/themes/color_manager.dart';
import '../../config/themes/custom_decoration.dart';
import '../../config/themes/custom_dialogs.dart';
import '../../config/themes/style_manager.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late String email, password;
  final TextEditingController _textEditingController = TextEditingController();
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
      } else {
        // ignore: use_build_context_synchronously
        customDialog.showCustomCupertinoDialog(
            context, "Hata", resultAuth.toString());
      }
      // ignore: empty_catches
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
      style: StyleManager.titleWhiteTextStyle,
      cursorColor: ColorManager.yellowColor,
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
      style: StyleManager.titleWhiteTextStyle,
      cursorColor: ColorManager.yellowColor,
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
      style: StyleManager.titleWhiteTextStyle,
      cursorColor: ColorManager.yellowColor,
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
