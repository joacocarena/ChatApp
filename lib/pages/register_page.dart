import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class RegisterPage extends StatelessWidget {

  static const String routeName = 'register';

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * .9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Logo(title: 'Register'),
                const _Form(),
                const Labels(route: 'login', title: '¿Already have an account?', subTitle: 'Log in with your account'),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Text('Terms and Conditions', style: TextStyle(fontWeight: FontWeight.w300))
                ),
              ],
            ),
          ),
        ),
      )
   );
  }
}

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Column(
        children: [
          
          CustomInput(
            icon: Icons.person_2_outlined,
            placeholder: 'Name',
            keyboardType: TextInputType.name,
            isPassword: false,
            textController: nameController,
          ),
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            isPassword: false,
            textController: emailController,
          ),
          CustomInput(
            icon: Icons.password,
            placeholder: 'Password',
            isPassword: true,
            keyboardType: TextInputType.text,
            textController: passwordController,
          ),
          
          CustomBtn(
            text: 'Log in', 
            onPressed: () {
              print(emailController.text);
              print(passwordController.text);
            },
          )

        ],
      ),
    );
  }
}