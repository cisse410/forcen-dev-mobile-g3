import 'package:flutter/material.dart';
import 'package:tasks_manager_forcen/constants/app_colors.dart';

class EditTaskPage extends StatefulWidget {
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;
  final String priority;

  const EditTaskPage({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.priority,
  }) : super(key: key);

  static const String routeName = '/edit-task';

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late String _priority;
  late DateTime _date;
  late TimeOfDay _time;
  String _selectedPriority = 'Low';
  final List<String> _priorities = ['Low', 'Medium', 'High'];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _descriptionController = TextEditingController(text: widget.description);
    _priority = widget.priority;
    _date = widget.date;
    _time = widget.time;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              value: _selectedPriority,
              decoration: InputDecoration(
                labelText: 'Select a priority',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              items: _priorities.map((String priority) {
                return DropdownMenuItem(
                  value: priority,
                  child: Text(priority),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPriority = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Date',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _date,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null && pickedDate != _date) {
                      setState(() {
                        _date = pickedDate;
                      });
                    }
                  },
                ),
              ),
              controller: TextEditingController(
                  text: "${_date.toLocal()}".split(' ')[0]),
            ),
            const SizedBox(height: 16),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Time',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () async {
                    final pickedTime = await showTimePicker(
                      context: context,
                      initialTime: _time,
                    );
                    if (pickedTime != null && pickedTime != _time) {
                      setState(() {
                        _time = pickedTime;
                      });
                    }
                  },
                ),
              ),
              controller: TextEditingController(
                  text: _time.format(context)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logique de sauvegarde de la tâche
              },
              child: const Text(
                'Edit',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.kPrimaryColor, // couleur de fond
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
