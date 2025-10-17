import 'package:flutter/material.dart';
import 'package:school_management/app/modules/auth/signup_screen/signup_screen_controller.dart';
import 'package:school_management/app/utils/app_style.dart';
import 'package:school_management/app/utils/custom_textformfield.dart';
import 'package:school_management/app/utils/app_colours.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupScreenController controller = Get.put(SignupScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backgroundColor,
      body: GestureDetector(
        onTap: () {
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
                            "Create your account",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppStyle.heightPercent(context, 3)),

                    // Signup Form
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
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColours.appColor,
                            ),
                          ),
                          SizedBox(height: AppStyle.heightPercent(context, 2)),
                          Text(
                            "Fill in your details to get started",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: AppStyle.heightPercent(context, 2)),

                          // User Type Selection
                          const Text(
                            "Select User Type",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColours.black,
                            ),
                          ),
                          SizedBox(height: AppStyle.heightPercent(context, 2)),
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

                          SizedBox(height: AppStyle.heightPercent(context, 2)),

                          // Full Name Field
                          CustomTextFormField(
                            hintText: "Enter your full name",
                            labelText: "Full Name",
                            prefixIcon: Icons.person_outline,
                            controller: controller.fullNameController,
                            keyboardType: TextInputType.name,
                            validator: controller.validateFullName,
                            textInputAction: TextInputAction.next,
                          ),

                          SizedBox(height: AppStyle.heightPercent(context, 2)),

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

                          // Phone Number Field
                          CustomTextFormField(
                            hintText: "Enter your phone number",
                            labelText: "Phone Number",
                            prefixIcon: Icons.phone_outlined,
                            controller: controller.phoneController,
                            keyboardType: TextInputType.phone,
                            validator: controller.validatePhone,
                            textInputAction: TextInputAction.next,
                          ),

                          SizedBox(height: AppStyle.heightPercent(context, 2)),

                          // Password Field
                          Obx(() => TextFormField(
                            controller: controller.passwordController,
                            obscureText: controller.isPasswordVisible.value,
                            validator: controller.validatePassword,
                            textInputAction: TextInputAction.next,
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

                          SizedBox(height: AppStyle.heightPercent(context, 2)),

                          // Confirm Password Field
                          Obx(() => TextFormField(
                            controller: controller.confirmPasswordController,
                            obscureText: controller.isConfirmPasswordVisible.value,
                            validator: controller.validateConfirmPassword,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => controller.signup(),
                            decoration: InputDecoration(
                              hintText: "Confirm your password",
                              labelText: "Confirm Password",
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              prefixIcon: const Icon(Icons.lock_outline, color: AppColours.appColor),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isConfirmPasswordVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColours.appColor,
                                ),
                                onPressed: controller.toggleConfirmPasswordVisibility,
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

                          SizedBox(height: AppStyle.heightPercent(context, 2)),

                          // Terms and Conditions
                          Obx(() => Row(
                            children: [
                              Checkbox(
                                value: controller.acceptTerms.value,
                                onChanged: (value) => controller.acceptTerms.value = value ?? false,
                                activeColor: AppColours.appColor,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => controller.toggleTerms(),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                      children: [
                                        const TextSpan(text: "I agree to the "),
                                        TextSpan(
                                          text: "Terms and Conditions",
                                          style: TextStyle(
                                            color: AppColours.appColor,
                                            fontWeight: FontWeight.w600,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                        const TextSpan(text: " and "),
                                        TextSpan(
                                          text: "Privacy Policy",
                                          style: TextStyle(
                                            color: AppColours.appColor,
                                            fontWeight: FontWeight.w600,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),

                          SizedBox(height: AppStyle.heightPercent(context, 2)),

                          // Signup Button
                          Obx(() => SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: controller.isLoading.value ? null : controller.signup,
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
                                      "Sign Up",
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

                    SizedBox(height: AppStyle.heightPercent(context, 2)),

                    // Login Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text(
                            "Login",
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
