import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/app/modules/STUDENT_APP/profile_screen/profile_screen_controller.dart';
import 'package:school_management/app/utils/app_colours.dart';
import 'package:school_management/app/utils/app_style.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileScreenController controller = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              _buildProfileHeader(context),

              SizedBox(height: AppStyle.heightPercent(context, 2)),
              
              // Profile Information
              _buildProfileInfo(),

              SizedBox(height: AppStyle.heightPercent(context, 2)),
              
              // Academic Information
              _buildAcademicInfo(),

              SizedBox(height: AppStyle.heightPercent(context, 2)),
              
              // Quick Stats
              _buildQuickStats(),

              SizedBox(height: AppStyle.heightPercent(context, 2)),
              
              // Menu Options
              _buildMenuOptions(),

              SizedBox(height: AppStyle.heightPercent(context, 2)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppStyle.widthPercent(context, 2)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColours.appColor, AppColours.appColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColours.appColor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: AppStyle.heightPercent(context, 2)),
          
          // Profile Picture
          Obx(() => GestureDetector(
            onTap: controller.changeProfilePicture,
            child: Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColours.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColours.white, width: 4),
                  ),
                  child: controller.profileImage.value.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(46),
                          child: Image.network(
                            controller.profileImage.value,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => _buildDefaultAvatar(),
                          ),
                        )
                      : _buildDefaultAvatar(),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColours.appColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColours.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: AppColours.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          )),

          SizedBox(height: AppStyle.heightPercent(context, 2)),
          
          // Student Name
          Obx(() => Text(
            controller.studentName.value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColours.white,
            ),
          )),
          
          const SizedBox(height: 4),
          
          // Student ID
          Obx(() => Text(
            "Student ID: ${controller.studentId.value}",
            style: TextStyle(
              fontSize: 16,
              color: AppColours.white.withOpacity(0.9),
            ),
          )),
          
          const SizedBox(height: 8),
          
          // Class and Section
          Obx(() => Text(
            "${controller.studentClass.value} • Section ${controller.section.value}",
            style: TextStyle(
              fontSize: 14,
              color: AppColours.white.withOpacity(0.8),
            ),
          )),

          SizedBox(height: AppStyle.heightPercent(context, 2)),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColours.appColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(46),
      ),
      child: const Icon(
        Icons.person,
        size: 50,
        color: AppColours.appColor,
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Personal Information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColours.black,
            ),
          ),
          const SizedBox(height: 16),
          
          _buildInfoRow(Icons.email, "Email", controller.email.value),
          _buildInfoRow(Icons.phone, "Phone", controller.phone.value),
          _buildInfoRow(Icons.location_on, "Address", controller.address.value),
          _buildInfoRow(Icons.cake, "Date of Birth", controller.dateOfBirth.value),
          _buildInfoRow(Icons.people, "Parent/Guardian", controller.parentName.value),
          _buildInfoRow(Icons.phone, "Parent Phone", controller.parentPhone.value),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColours.appColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColours.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Academic Information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColours.black,
            ),
          ),
          const SizedBox(height: 16),
          
          _buildAcademicRow("Academic Year", controller.academicYear.value),
          _buildAcademicRow("Class Teacher", controller.classTeacher.value),
          _buildAcademicRow("Roll Number", controller.rollNumber.value),
          _buildAcademicRow("Admission Date", controller.admissionDate.value),
          _buildAcademicRow("Blood Group", controller.bloodGroup.value),
        ],
      ),
    );
  }

  Widget _buildAcademicRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColours.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Quick Stats",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColours.black,
            ),
          ),
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: _buildStatItem("Attendance", "${controller.attendancePercentage}%", Colors.green),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatItem("GPA", controller.gpa.value, Colors.blue),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatItem("Assignments", "${controller.completedAssignments}", Colors.orange),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatItem("Exams", "${controller.examsTaken}", Colors.purple),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOptions() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColours.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildMenuOption(Icons.edit, "Edit Profile", () => controller.editProfile()),
          _buildMenuDivider(),
          _buildMenuOption(Icons.settings, "Settings", () => controller.openSettings()),
          _buildMenuDivider(),
          _buildMenuOption(Icons.notifications, "Notifications", () => controller.openNotifications()),
          _buildMenuDivider(),
          _buildMenuOption(Icons.help, "Help & Support", () => controller.openHelp()),
          _buildMenuDivider(),
          _buildMenuOption(Icons.logout, "Logout", () => controller.showLogoutDialog(), isDestructive: true),
        ],
      ),
    );
  }

  Widget _buildMenuOption(IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? Colors.red : AppColours.appColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? Colors.red : AppColours.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildMenuDivider() {
    return Divider(
      height: 1,
      color: Colors.grey[200],
      indent: 16,
      endIndent: 16,
    );
  }
}
