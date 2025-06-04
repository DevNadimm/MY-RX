import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:new_app/features/auth/widgets/auth_footer.dart';
import 'package:new_app/features/dashboard/screens/home_dashboard_screen.dart';
import 'package:new_app/shared/widgets/custom_text_field.dart';

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
                  'welcome_back'.tr,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'welcome_back_subtitle'.tr,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  controller: _emailController,
                  label: 'email_label'.tr,
                  hintText: 'email_hint'.tr,
                  validationLabel: "Email",
                  isRequired: true,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    HugeIcons.strokeRoundedMail01,
                    color: Colors.grey.shade600,
                  ),
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Email is required';
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
                CustomTextField(
                  controller: _passwordController,
                  label: 'password_label'.tr,
                  hintText: 'password_hint'.tr,
                  validationLabel: "Password",
                  isRequired: true,
                  keyboardType: TextInputType.text,
                  obscureText: isPasswordVisible ? false : true,
                  prefixIcon: Icon(
                    HugeIcons.strokeRoundedLockPassword,
                    color: Colors.grey.shade600,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: isPasswordVisible
                        ? Icon(Icons.visibility_off,
                            color: Colors.grey.shade600)
                        : Icon(Icons.visibility, color: Colors.grey.shade600),
                  ),
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return 'Password is required';
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
                      //if (_globalKey.currentState?.validate() ?? false) {
                        Get.offAll(() => const HomeDashboardScreen());
                      //}
                    },
                    child: Text('sign_in'.tr),
                  ),
                ),
                const SizedBox(height: 24),
                AuthFooter(
                  label: 'dont_have_account'.tr,
                  actionText: 'sign_up'.tr,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
