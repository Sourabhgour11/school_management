import 'package:flutter/material.dart';
import 'package:school_management/app/modules/auth/login_screen/login_screen_controller.dart';
import 'package:school_management/app/routes/app_routes.dart';
import 'package:school_management/app/utils/app_style.dart';
import 'package:school_management/app/utils/custom_textformfield.dart';
import 'package:school_management/app/utils/app_colours.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginScreenController controller = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backgroundColor,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppStyle.heightPercent(context, 2)),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: AppStyle.heightPercent(context, 3)),

                    // App Logo and Title
                    Container(
                      padding: EdgeInsets.all(AppStyle.heightPercent(context, 2)),
                      decoration: BoxDecoration(
                        color: AppColours.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColours.appColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Icon(
                              Icons.school,
                              size: 40,
                              color: AppColours.appColor,
                            ),
                          ),
                           SizedBox(height: AppStyle.heightPercent(context, 1.2)),
                          const Text(
                            "School Management",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColours.appColor,
                            ),
                          ),
                           SizedBox(height: AppStyle.heightPercent(context, 1.2)),
                          Text(
                            "Welcome Back!",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppStyle.heightPercent(context, 2)),

                    // Login Form
                    Container(
                      padding: EdgeInsets.all(AppStyle.heightPercent(context, 3)),
                      decoration: BoxDecoration(
                        color: AppColours.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColours.appColor,
                            ),
                          ),
                          SizedBox(height: AppStyle.heightPercent(context, 2)),
                          Text(
                            "Sign in to your account",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: AppStyle.heightPercent(context, 3)),

                          // User Type Selection
                          const Text(
                            "Select User Type",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColours.black,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Obx(() => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: _buildUserTypeButton(
                                    "Student",
                                    Icons.person,
                                    controller.selectedUserType.value == "Student",
                                    () => controller.setUserType("Student"),
                                  ),
                                ),
                                Expanded(
                                  child: _buildUserTypeButton(
                                    "Teacher",
                                    Icons.person_outline,
                                    controller.selectedUserType.value == "Teacher",
                                    () => controller.setUserType("Teacher"),
                                  ),
                                ),
                                // Expanded(
                                //   child: _buildUserTypeButton(
                                //     "Admin",
                                //     Icons.admin_panel_settings,
                                //     controller.selectedUserType.value == "Admin",
                                //     () => controller.setUserType("Admin"),
                                //   ),
                                // ),
                                Expanded(
                                  child: _buildUserTypeButton(
                                    "Parent",
                                    Icons.family_restroom,
                                    controller.selectedUserType.value == "Parent",
                                    () => controller.setUserType("Parent"),
                                  ),
                                ),
                              ],
                            ),
                          )),

                          SizedBox(height: AppStyle.heightPercent(context, 3)),

                          // Email Field
                          CustomTextFormField(
                            hintText: "Enter your email",
                            labelText: "Email Address",
                            prefixIcon: Icons.email_outlined,
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: controller.validateEmail,
                            textInputAction: TextInputAction.next,
                          ),

                          SizedBox(height: AppStyle.heightPercent(context, 2)),

                          // Password Field
                          Obx(() => TextFormField(
                            controller: controller.passwordController,
                            obscureText: controller.isPasswordVisible.value,
                            validator: controller.validatePassword,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => controller.login(),
                            decoration: InputDecoration(
                              hintText: "Enter your password",
                              labelText: "Password",
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              prefixIcon: const Icon(Icons.lock_outline, color: AppColours.appColor),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isPasswordVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColours.appColor,
                                ),
                                onPressed: controller.togglePasswordVisibility,
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: AppColours.appColor, width: 2),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.red, width: 2),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.red, width: 2),
                              ),
                            ),
                          )),

                          SizedBox(height: AppStyle.heightPercent(context, 1.8)),

                          // Remember Me & Forgot Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => Row(
                                children: [
                                  Checkbox(
                                    value: controller.rememberMe.value,
                                    onChanged: (value) => controller.rememberMe.value = value ?? false,
                                    activeColor: AppColours.appColor,
                                  ),
                                  const Text("Remember Me"),
                                ],
                              )),
                              TextButton(
                                onPressed: (){
                                  Get.toNamed(AppRoutes.forgotPassword);
                                },
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: AppColours.appColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: AppStyle.heightPercent(context, 3)),

                          // Login Button
                          Obx(() => SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: controller.isLoading.value ? null : controller.login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColours.appColor,
                                foregroundColor: AppColours.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: controller.isLoading.value
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: AppColours.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          )),
                        ],
                      ),
                    ),

                    SizedBox(height: AppStyle.heightPercent(context, 3)),

                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        TextButton(
                          onPressed: controller.goToSignUp,
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColours.appColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserTypeButton(String title, IconData icon, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColours.appColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColours.white : Colors.grey[600],
              size: 20,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColours.white : Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
