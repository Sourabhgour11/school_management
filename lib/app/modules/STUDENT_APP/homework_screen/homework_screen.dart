import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/app/modules/STUDENT_APP/homework_screen/homework_screen_controller.dart';
import 'package:school_management/app/utils/app_colours.dart';

class HomeworkScreen extends StatelessWidget {
  HomeworkScreen({super.key});

  final HomeworkScreenController controller = Get.put(HomeworkScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Filter Tabs
            _buildFilterTabs(),
            
            // Homework List
            Expanded(
              child: Obx(() => controller.homeworkList.isEmpty
                  ? _buildEmptyState()
                  : _buildHomeworkList()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColours.appColor, AppColours.appColor2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Assignments & Homework",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColours.white,
            ),
          ),
          const SizedBox(height: 8),
          Obx(() => Text(
            "${controller.pendingCount} pending • ${controller.completedCount} completed",
            style: const TextStyle(
              fontSize: 14,
              color: AppColours.white,
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Obx(() => Row(
        children: [
          Expanded(
            child: _buildFilterTab("All", controller.selectedFilter.value == "all", () => controller.setFilter("all")),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildFilterTab("Pending", controller.selectedFilter.value == "pending", () => controller.setFilter("pending")),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildFilterTab("Completed", controller.selectedFilter.value == "completed", () => controller.setFilter("completed")),
          ),
        ],
      )),
    );
  }

  Widget _buildFilterTab(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColours.appColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? AppColours.white : Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.assignment_outlined,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              "No homework found",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "You're all caught up! Check back later for new assignments.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeworkList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: controller.filteredHomework.length,
      itemBuilder: (context, index) {
        final homework = controller.filteredHomework[index];
        return _buildHomeworkCard(homework);
      },
    );
  }

  Widget _buildHomeworkCard(Map<String, dynamic> homework) {
    Color statusColor = Colors.orange;
    IconData statusIcon = Icons.assignment;
    String statusText = "Pending";

    if (homework['isCompleted']) {
      statusColor = Colors.green;
      statusIcon = Icons.check_circle;
      statusText = "Completed";
    } else if (homework['isOverdue']) {
      statusColor = Colors.red;
      statusIcon = Icons.warning;
      statusText = "Overdue";
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
        border: homework['isOverdue'] ? Border.all(color: Colors.red.withOpacity(0.3), width: 1) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  statusIcon,
                  color: statusColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homework['subject'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      homework['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColours.black,
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
                  statusText,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          Text(
            homework['description'],
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          
          const SizedBox(height: 12),
          
          Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.grey[500]),
              const SizedBox(width: 4),
              Text(
                "Due: ${homework['dueDate']}",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 16),
              Icon(Icons.person, size: 16, color: Colors.grey[500]),
              const SizedBox(width: 4),
              Text(
                homework['teacher'],
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          
          if (homework['attachments'] > 0) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.attach_file, size: 16, color: Colors.grey[500]),
                const SizedBox(width: 4),
                Text(
                  "${homework['attachments']} attachment(s)",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
          
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => controller.viewDetails(homework),
                  icon: const Icon(Icons.visibility, size: 16),
                  label: const Text("View Details"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColours.appColor,
                    side: BorderSide(color: AppColours.appColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              if (!homework['isCompleted'])
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => controller.submitHomework(homework),
                    icon: const Icon(Icons.upload, size: 16),
                    label: const Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColours.appColor,
                      foregroundColor: AppColours.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
