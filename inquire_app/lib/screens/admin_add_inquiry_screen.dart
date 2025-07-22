import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AdminAddInquiryScreen extends StatefulWidget {
  const AdminAddInquiryScreen({super.key});

  @override
  State<AdminAddInquiryScreen> createState() => _AdminAddInquiryScreenState();
}

class _AdminAddInquiryScreenState extends State<AdminAddInquiryScreen> {
  final keywordController = TextEditingController();
  final answerController = TextEditingController();
  String message = '';

  void addInquiry() async {
    final response = await ApiService.addInquiry(
      keywordController.text.trim(),
      answerController.text.trim(),
    );
    setState(() => message = response['message']);
  }

  @override
  void dispose() {
    keywordController.dispose();
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFcfe6df),
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        title: const Text('Add Inquiry & Answer'),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create FAQ Entry',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),

              // Keyword Field
              TextField(
                controller: keywordController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Question Keywords (comma-separated)',
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Answer Field
              TextField(
                controller: answerController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Answer',
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: addInquiry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[700],
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Add Inquiry',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Success Message
              if (message.isNotEmpty)
                Text(
                  message,
                  style: const TextStyle(color: Colors.green, fontSize: 16),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
