import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/app/modules/STUDENT_APP/attendance_screen/attendance_screen_controller.dart';
import 'package:school_management/app/utils/app_colours.dart';
import 'package:school_management/app/utils/app_style.dart';

class AttendanceScreen extends StatelessWidget {
  AttendanceScreen({super.key});

  final AttendanceScreenController controller = Get.put(AttendanceScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppStyle.heightPercent(context, 2)),
                
                // Header
                _buildHeader(context),

                SizedBox(height: AppStyle.heightPercent(context, 2)),
                
                // Overall Attendance Stats
                _buildOverallStats(context),

                SizedBox(height: AppStyle.heightPercent(context, 2)),
                
                // Monthly Calendar
                _buildMonthlyCalendar(),

                SizedBox(height: AppStyle.heightPercent(context, 2)),
                
                // Subject-wise Attendance
                _buildSubjectWiseAttendance(),

                SizedBox(height: AppStyle.heightPercent(context, 2)),
                
                // Recent Attendance Records
                _buildRecentRecords(),

                SizedBox(height: AppStyle.heightPercent(context, 2)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppStyle.widthPercent(context, 4)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColours.appColor, AppColours.appColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColours.appColor.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Attendance Overview",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColours.white,
                  ),
                ),
                const SizedBox(height: 8),
                Obx(() => Text(
                  "Overall: ${controller.overallAttendance}%",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColours.white,
                  ),
                )),
                const SizedBox(height: 4),
                Text(
                  "Last updated: ${controller.lastUpdated}",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColours.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColours.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.event_note,
              size: 30,
              color: AppColours.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverallStats(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            "Present",
            "${controller.presentDays}",
            Icons.check_circle,
            Colors.green,
          ),
        ),
        SizedBox(width: AppStyle.widthPercent(context, 2)),
        Expanded(
          child: _buildStatCard(
            "Absent",
            "${controller.absentDays}",
            Icons.cancel,
            Colors.red,
          ),
        ),
        SizedBox(width: AppStyle.widthPercent(context, 2)),
        Expanded(
          child: _buildStatCard(
            "Late",
            "${controller.lateDays}",
            Icons.schedule,
            Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
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
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
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
            title,
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

  Widget _buildMonthlyCalendar() {
    return Container(
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
          Row(
            children: [
              Icon(Icons.calendar_month, color: AppColours.appColor, size: 24),
              const SizedBox(width: 8),
              const Text(
                "This Month",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColours.black,
                ),
              ),
              const Spacer(),
              Obx(() => Text(
                controller.currentMonth.value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              )),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() => _buildCalendarGrid()),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: controller.calendarDays.length,
      itemBuilder: (context, index) {
        final day = controller.calendarDays[index];
        return _buildCalendarDay(day);
      },
    );
  }

  Widget _buildCalendarDay(Map<String, dynamic> day) {
    Color backgroundColor = Colors.grey[100]!;
    Color textColor = Colors.grey[600]!;
    IconData? icon;

    if (day['isCurrentMonth']) {
      switch (day['status']) {
        case 'present':
          backgroundColor = Colors.green.withOpacity(0.2);
          textColor = Colors.green[700]!;
          icon = Icons.check;
          break;
        case 'absent':
          backgroundColor = Colors.red.withOpacity(0.2);
          textColor = Colors.red[700]!;
          icon = Icons.close;
          break;
        case 'late':
          backgroundColor = Colors.orange.withOpacity(0.2);
          textColor = Colors.orange[700]!;
          icon = Icons.schedule;
          break;
        default:
          backgroundColor = Colors.grey[50]!;
          textColor = Colors.grey[600]!;
      }
    } else {
      backgroundColor = Colors.grey[50]!;
      textColor = Colors.grey[400]!;
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: day['isToday'] ? Border.all(color: AppColours.appColor, width: 2) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day['day'].toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: day['isToday'] ? FontWeight.bold : FontWeight.normal,
              color: textColor,
            ),
          ),
          if (icon != null)
            Icon(
              icon,
              size: 12,
              color: textColor,
            ),
        ],
      ),
    );
  }

  Widget _buildSubjectWiseAttendance() {
    return Container(
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
          Row(
            children: [
              Icon(Icons.subject, color: AppColours.appColor, size: 24),
              const SizedBox(width: 8),
              const Text(
                "Subject-wise Attendance",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColours.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() => Column(
            children: controller.subjectAttendance
                .map((subject) => _buildSubjectItem(subject))
                .toList(),
          )),
        ],
      ),
    );
  }

  Widget _buildSubjectItem(Map<String, dynamic> subject) {
    final percentage = subject['percentage'];
    Color progressColor = Colors.green;
    if (percentage < 75) progressColor = Colors.red;
    else if (percentage < 85) progressColor = Colors.orange;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  subject['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColours.black,
                  ),
                ),
              ),
              Text(
                "${percentage}%",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: progressColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            minHeight: 6,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Present: ${subject['present']}",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                "Total: ${subject['total']}",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentRecords() {
    return Container(
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
          Row(
            children: [
              Icon(Icons.history, color: AppColours.appColor, size: 24),
              const SizedBox(width: 8),
              const Text(
                "Recent Records",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColours.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() => Column(
            children: controller.recentRecords
                .map((record) => _buildRecordItem(record))
                .toList(),
          )),
        ],
      ),
    );
  }

  Widget _buildRecordItem(Map<String, dynamic> record) {
    Color statusColor = Colors.green;
    IconData statusIcon = Icons.check_circle;
    
    switch (record['status']) {
      case 'absent':
        statusColor = Colors.red;
        statusIcon = Icons.cancel;
        break;
      case 'late':
        statusColor = Colors.orange;
        statusIcon = Icons.schedule;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: statusColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(statusIcon, color: statusColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record['subject'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColours.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${record['date']} • ${record['time']}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              record['status'].toUpperCase(),
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
