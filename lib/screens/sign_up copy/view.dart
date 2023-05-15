import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guie/core/color.dart';
import 'package:my_guie/core/size.dart';
import 'package:my_guie/core/validation.dart';
import 'package:my_guie/helpers/navigation.dart';
import 'package:my_guie/screens/bar_code/view.dart';
import 'package:my_guie/screens/sign_up/cubit.dart';
import 'package:my_guie/screens/sign_up/states.dart';
import 'package:my_guie/widgets/btn.dart';
import 'package:my_guie/widgets/txt_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void dispose() {
    SignUpCubit.get(context).nameController.dispose();
    SignUpCubit.get(context).phoneController.dispose();
    SignUpCubit.get(context).emailController.dispose();
    SignUpCubit.get(context).ageController.dispose();
    SignUpCubit.get(context).phoneNumberController.dispose();
    SignUpCubit.get(context).passwordController.dispose();
    SignUpCubit.get(context).confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: Builder(builder: (context) {
          SignUpCubit cubit = SignUpCubit.get(context);
          return BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return Form(
                key: cubit.formKey,
                child: ListView(
                  padding: const EdgeInsets.all(25),
                  children: [
                    CustomTextField(
                        hint: 'Full Name',
                        keyboardType: TextInputType.name,
                        validator: validateFullName,
                        controller: cubit.nameController,
                        icon: Icons.person),
                    heght10,
                    CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        hint: 'Email',
                        validator: validateEmail,
                        controller: cubit.emailController,
                        icon: Icons.email),
                    heght10,
                    CustomTextField(
                        keyboardType: TextInputType.datetime,
                        hint: 'Age',
                        validator: validateAge,
                        controller: cubit.ageController,
                        icon: Icons.calendar_month),
                    heght10,
                    CustomTextField(
                        hint: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        validator: validatePhoneNumber,
                        controller: cubit.phoneNumberController,
                        icon: Icons.phone),
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
                        title: 'Sign up',
                        onTap: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.formKey.currentState!.save();
                            RouteManager.navigateTo(const QrCode());
                          }
                        }),
                    heght20,
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Already have an account? sign in',
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