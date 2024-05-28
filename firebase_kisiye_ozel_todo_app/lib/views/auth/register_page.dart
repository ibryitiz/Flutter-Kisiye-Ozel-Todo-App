import 'package:firebase_kisiye_ozel_todo_app/components/my_button.dart';
import 'package:firebase_kisiye_ozel_todo_app/components/my_text_field.dart';
import 'package:firebase_kisiye_ozel_todo_app/constant/my_colors.dart';
import 'package:firebase_kisiye_ozel_todo_app/constant/my_texts.dart';
import 'package:firebase_kisiye_ozel_todo_app/view_model/auth_view_model/login_or_register_page_view_model.dart';
import 'package:firebase_kisiye_ozel_todo_app/view_model/auth_view_model/register_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.instance.listTileColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildBigColumn,
          ),
        ),
      ),
    );
  }

  Widget get _buildBigColumn => Column(
        children: [
          _buildLogo,
          const SizedBox(
            height: 40,
          ),
          _buildWelcomeText,
          const SizedBox(
            height: 25,
          ),
          _buildTextFields(),
          const SizedBox(
            height: 25,
          ),
          _buildSignUpButton(),
          const SizedBox(
            height: 20,
          ),
          _buildNotAMemberRow,
        ],
      );

  Widget get _buildLogo => const Icon(
        Icons.lock,
        size: 120,
      );

  Widget get _buildWelcomeText => Text(
        MyTexts.instance.welcomeText,
        style: TextStyle(
          fontSize: 17,
          color: MyColors.instance.textColor,
        ),
      );

  Widget _buildTextFields() {
    RegisterPageViewModel viewModel = Provider.of<RegisterPageViewModel>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: MyTextField(
                hintText: MyTexts.instance.nameText,
                controller: viewModel.nameController,
                obscureText: false,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: MyTextField(
                hintText: MyTexts.instance.surnameText,
                controller: viewModel.surnameController,
                obscureText: false,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        MyTextField(
          hintText: MyTexts.instance.emailText,
          obscureText: false,
          controller: viewModel.emailController,
        ),
        const SizedBox(
          height: 10,
        ),
        MyTextField(
          hintText: MyTexts.instance.passwordText,
          obscureText: true,
          controller: viewModel.passwordController,
        ),
        const SizedBox(
          height: 10,
        ),
        MyTextField(
          hintText: MyTexts.instance.confirmPasswordText,
          obscureText: true,
          controller: viewModel.confirmPasswordController,
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    RegisterPageViewModel viewModel = Provider.of<RegisterPageViewModel>(context, listen: false);

    return MyButton(
      color: MyColors.instance.black,
      text: MyTexts.instance.signUpButtonText,
      onTap: () {
        viewModel.register(context);
      },
      textColor: MyColors.instance.white,
    );
  }

  Widget get _buildNotAMemberRow => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            MyTexts.instance.alreadyHaveText,
            style: TextStyle(
              color: MyColors.instance.textColor,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Provider.of<LoginOrRegisterPageViewModel>(context, listen: false)
                  .togglePages(Provider.of<LoginOrRegisterPageViewModel>(context, listen: false).isLoginPage);
            },
            child: Text(
              MyTexts.instance.loginNowText,
              style: TextStyle(
                color: MyColors.instance.blueTextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
}
