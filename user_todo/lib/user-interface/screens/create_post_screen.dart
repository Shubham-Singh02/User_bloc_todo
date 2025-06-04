import 'package:flutter/material.dart';
import 'package:user_todo/utils/colors.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  void _submitPost() {
    if (_titleController.text.isNotEmpty && _bodyController.text.isNotEmpty) {
      Navigator.pop(context, {
        'title': _titleController.text,
        'body': _bodyController.text,
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title and body cannot be empty')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Create Post'),backgroundColor: Colors.transparent,),
      body: Stack(
        children: [
           Container(
            decoration:BoxDecoration(
              gradient: background,
            ),
           ),
          SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title',enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  ),
                  
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _bodyController,
                  decoration: InputDecoration(labelText: 'Body',
                   floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.white,
                  filled: true,),
                  maxLines: 5,
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                       const Color.fromARGB(255, 255, 241, 183),
                       ),
                  ),
                 
                  onPressed: _submitPost,
                  icon: const Icon(Icons.save,color: Colors.black54),
                  label: const Text("Save",style: TextStyle(color: Colors.black54),),
                )
              ],
            ),
          ),
        ),
        ]
      ),
    );
  }
}
