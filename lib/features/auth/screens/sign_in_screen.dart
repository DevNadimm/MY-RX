import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/features/auth/widgets/auth_footer.dart';
import 'package:new_app/features/dashboard/screens/home_dashboard_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Text(
                  "Welcome back!",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  "It's great to have you back with us again!",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Please enter your email';
                    }
                    final emailRegex =
                    RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
                    if (!emailRegex.hasMatch(email)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    labelText: "Password",
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.grey.shade600,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: isPasswordVisible
                          ? Icon(Icons.visibility_off, color: Colors.grey.shade600)
                          : Icon(Icons.visibility, color: Colors.grey.shade600),
                    ),
                  ),
                  obscureText: isPasswordVisible ? false : true,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (password.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const HomeDashboardScreen());
                      // if (_globalKey.currentState?.validate() ?? false) {
                      //   // onTapSignIn(
                      //   //   _emailController.text.trim(),
                      //   //   _passwordController.text.trim(),
                      //   // );
                      // }
                    },
                    child: const Text("Sign In"),
                  ),
                ),
                // const SizedBox(height: 32),
                // const AuthDivider(
                //   label: 'or sign in with',
                // ),
                // const SizedBox(height: 32),
                // Row(
                //   children: [
                //     Expanded(
                //       child: SocialButton(
                //         onTap: () {},
                //         imgPath: 'assets/logos/google.png',
                //         label: 'Google',
                //         context: context,
                //       ),
                //     ),
                //     const SizedBox(width: 16),
                //     Expanded(
                //       child: SocialButton(
                //         onTap: () {},
                //         imgPath: 'assets/logos/facebook.png',
                //         label: 'Facebook',
                //         context: context,
                //       ),
                //     )
                //   ],
                // ),
                const SizedBox(height: 24),
                AuthFooter(
                  label: "Don't have an account? ",
                  actionText: "Sign Up",
                  onTap: () {
                    //Get.to(const SignUpScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void onTapSignIn(String email, String password) async {
  //   final controller = SignInController.instance;
  //   final isSignIn = await controller.signIn(email: email, password: password);
  //   if (isSignIn) {
  //     controller.isJoinedBatch
  //         ? Get.offAll(const HomeScreen())
  //         : Get.offAll(const JoinBatchScreen());
  //   } else {
  //     SnackBarMessage.errorMessage(
  //       controller.errorMessage ?? "Something went wrong!",
  //     );
  //   }
  // }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}