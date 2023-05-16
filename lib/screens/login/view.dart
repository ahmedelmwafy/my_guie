import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guie/core/color.dart';
import 'package:my_guie/core/size.dart';
import 'package:my_guie/core/validation.dart';
import 'package:my_guie/helpers/navigation.dart';
import 'package:my_guie/screens/qr_code/view.dart';
import 'package:my_guie/screens/login/cubit.dart';
import 'package:my_guie/screens/login/states.dart';
import 'package:my_guie/widgets/btn.dart';
import 'package:my_guie/widgets/svg.dart';
import 'package:my_guie/widgets/txt_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void dispose() {
    LoginCubit.get(context).emailController.dispose();
    LoginCubit.get(context).passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: Builder(builder: (context) {
          LoginCubit cubit = LoginCubit.get(context);
          return BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Form(
                key: cubit.formKey,
                child: ListView(
                  padding: const EdgeInsets.all(25),
                  children: [
                    customSvg(name: 'login'),
                    CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        hint: 'Email',
                        validator: validateEmail,
                        controller: cubit.emailController,
                        icon: Icons.email),
                    heght10,
                    CustomTextField(
                        obscureText: true,
                        hint: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        validator: validatePassword,
                        controller: cubit.passwordController,
                        icon: Icons.password),
                    const SizedBox(
                      height: 50,
                    ),
                    customButton(
                        context: context,
                        title: 'login',
                        onTap: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.formKey.currentState!.save();
                            RouteManager.navigateTo(const QrCode());
                          }
                        }),
                    heght20,
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          RouteManager.pop();
                        },
                        child: const Text(
                          "Don't have an account? sign up",
                          style: TextStyle(color: kMainColor),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
  // heght10,
                    // customTextField(
                    //     obscureText: true,
                    //     keyboardType: TextInputType.visiblePassword,
                    //     hint: 'Confirm Password',
                    //     validator: (confirmPassword) {
                    //       validateConfirmPassword(
                    //           confirmPassword, cubit.nameController.text);
                    //     },
                    //     controller: cubit.confirmPasswordController,
                    //     icon: Icons.password),