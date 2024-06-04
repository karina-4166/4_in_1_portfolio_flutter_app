import 'package:flutter/material.dart';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:file_picker/file_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _resumeFile;

  Future<void> _pickResume() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf', 'doc']);
    if (result != null) {
      setState(() {
        _resumeFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Professional Portfolio'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Karina Chakraborty',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Undergraduate researcher, 4IR Research Cell\nDaffodil International University',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              _buildSectionTitle('Professional Summary'),
              const Text(
                'An IoT specialist, Tech enthusiast, and a friend',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 24),
              _buildSectionTitle('Skills'),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: <String>[
                  'AI & Machine Learning',
                  'IoT',
                  'Data Analysis',
                  'Research & Development',
                  'Project Management',
                ].map((skill) => Chip(label: Text(skill))).toList(),
              ),
              const SizedBox(height: 24),
              _buildSectionTitle('Education'),
              _buildEducationItem(
                'B.Sc. in Computer Science and Engineering',
                'Daffodil International University',
                '2021 - Present',
              ),
              _buildEducationItem(
                'Higher Secondary Certificate',
                'EnayetBazar Mohila College, Chittagong',
                '2018 - 2020',
              ),
              _buildEducationItem(
                'Secondary School Certificate',
                'Aparna Charan city corporation girls High School',
                '2016 - 2018',
              ),
              const SizedBox(height: 24),
              _buildSectionTitle('Experience'),
              _buildExperienceItem(
                'Undergraduate Researcher, 4IR Research Cell',
                'Daffodil International University',
                '2024 - Present',
                'Leading various research projects focused on AI, IoT, and machine learning to drive innovation and technological advancement.',
              ),
              _buildExperienceItem(
                'Student',
                'Daffodil International University',
                '2021 - Present',
                '-',
              ),
              _buildExperienceItem(
                'Executive Member',
                'Prothom Alo Bondhushava',
                '2023 - present',
                '-',
              ),
              SizedBox(height: 24),
              _buildSectionTitle('Projects'),
              ProjectCard(
                title: 'A YOLO based Rose leaf disease detection',
                description:
                    'A YOLO-based project to identify rose leaf disease by deep learning techniques.',
              ),
              ProjectCard(
                title: 'AI-Based technology for vision impaired community',
                description:
                    'Development of a web-based assistive technology that can be converted into a AI-based technology, aimed at enhancing interactive learning.',
              ),
              ProjectCard(
                title: 'SMART Home System',
                description:
                    ' This project aims to create a connected home environment where appliances can be controlled remotely, and security is enhanced using various sensors, all managed through an Arduino microcontroller and accessible via a smartphone or web interface.',
              ),
              SizedBox(height: 24),
              _buildSectionTitle('Upload Resume/CV'),
              Center(
                child: ElevatedButton(
                  onPressed: _pickResume,
                  child: Text('Upload Resume/CV'),
                ),
              ),
              if (_resumeFile != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Uploaded: ${_resumeFile!.path.split('/').last}',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
              SizedBox(height: 24),
              _buildSectionTitle('Social Media'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.facebook_outlined),
                    onPressed: () {},
                    color: Colors.blue,
                    iconSize: 40,
                  ),
                  IconButton(
                    icon: Icon(Icons.linked_camera),
                    onPressed: () {},
                    color: Colors.blue,
                    iconSize: 40,
                  ),
                  IconButton(
                    icon: Icon(Icons.linked_camera),
                    onPressed: () {},
                    color: Colors.blue,
                    iconSize: 40,
                  ),
                ],
              ),
              SizedBox(height: 24),
              _buildSectionTitle('Blog'),
              BlogSection(),
              SizedBox(height: 24),
              _buildSectionTitle('Achievements & Certifications'),
              ElevatedButton(
                onPressed: () {},
                child: Text('Upload Achievements/Certifications'),
              ),
              // Add your uploaded achievements and certifications here
              SizedBox(height: 24),
              _buildSectionTitle('Contact Information'),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('chakraborty15-4166@diu.edu.bd'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('+8801815710454'),
              ),
              ListTile(
                leading: Icon(Icons.web),
                title: Text('-'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
  }

  Widget _buildEducationItem(String degree, String institution, String period) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.school, color: Colors.blueAccent),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  degree,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  institution,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  period,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(
      String title, String company, String period, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.work, color: Colors.blueAccent),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  company,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  period,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  ProjectCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class BlogSection extends StatefulWidget {
  @override
  _BlogSectionState createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection> {
  final List<Map<String, String>> _blogPosts = [];

  void _addBlogPost() {
    showDialog(
      context: context,
      builder: (context) {
        final titleController = TextEditingController();
        final contentController = TextEditingController();
        return AlertDialog(
          title: const Text('New Blog Post'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                maxLines: 4,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _blogPosts.add({
                    'title': titleController.text,
                    'content': contentController.text,
                  });
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _addBlogPost,
          child: const Text('Add Blog Post'),
        ),
        ..._blogPosts.map((post) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['title']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(post['content']!),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
