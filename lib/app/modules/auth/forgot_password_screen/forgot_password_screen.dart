import 'package:flutter/material.dart';
import 'package:school_management/app/modules/auth/forgot_password_screen/forgot_password_screen_controller.dart';
import 'package:school_management/app/utils/app_export.dart';
import 'package:school_management/app/utils/custom_textformfield.dart';
import 'package:school_management/app/utils/app_colours.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final ForgotPasswordScreenController controller = Get.put(ForgotPasswordScreenController());

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
              padding: EdgeInsets.all(AppStyle.widthPercent(context, 2)),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),

                    // App Logo and Title
                    Container(
                      padding: EdgeInsets.all(AppStyle.widthPercent(context, 2)),
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
                              Icons.lock_reset,
                              size: 40,
                              color: AppColours.appColor,
                            ),
                          ),
                          SizedBox(height: AppStyle.heightPercent(context, 2)),
                          const Text(
                            "Reset Password",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColours.appColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Enter your email to reset password",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Forgot Password Form
                    Container(
                      padding: EdgeInsets.all(AppStyle.widthPercent(context, 3)),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColours.appColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Don't worry! It happens. Please enter your email address and we'll send you a reset link.",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Email Field
                          CustomTextFormField(
                            hintText: "Enter your email address",
                            labelText: "Email Address",
                            prefixIcon: Icons.email_outlined,
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: controller.validateEmail,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => controller.sendResetLink(),
                          ),

                          SizedBox(height: AppStyle.heightPercent(context, 3)),

                          // Send Reset Link Button
                          Obx(() => SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: controller.isLoading.value ? null : controller.sendResetLink,
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
                                      "Send Reset Link",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          )),

                          SizedBox(height: AppStyle.heightPercent(context, 2)),

                          // Back to Login
                          Center(
                            child: TextButton(
                              onPressed: () => Get.back(),
                              child: const Text(
                                "Back to Login",
                                style: TextStyle(
                                  color: AppColours.appColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Help Section
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.blue.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.help_outline,
                            color: Colors.blue[600],
                            size: 32,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Need Help?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "If you're having trouble resetting your password, please contact your school administrator for assistance.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton.icon(
                            onPressed: controller.contactSupport,
                            icon: const Icon(Icons.support_agent, size: 18),
                            label: const Text("Contact Support"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[600],
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppStyle.heightPercent(context, 2)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
