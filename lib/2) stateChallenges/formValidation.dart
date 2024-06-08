import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormValidateScaffold extends StatelessWidget {
  const FormValidateScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.zoom_in_map_outlined),
        title: const Text('Welcome to Form'),
      ),
      body: const FormStateConfig(),
    );
  }
}

typedef SubmitCallback = Function(String value);

class FormDisplay extends StatelessWidget {
  FormDisplay({super.key, required this.onSubmit});
  TextEditingController nameController = TextEditingController();
  final SubmitCallback onSubmit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Enter name'),
        ),
        ElevatedButton(
            onPressed: () => onSubmit(nameController.text),
            child: const Text('Submit'))
      ],
    );
  }
}

class FormStateConfig extends StatefulWidget {
  const FormStateConfig({super.key});

  @override
  State<FormStateConfig> createState() => _FormStateDisplay();
}

class _FormStateDisplay extends State<FormStateConfig> {
  void onSubmit(String value) {
    if (value.isEmpty) {
      print('Empty name');
    } else {
      print(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FormDisplay(
        onSubmit: onSubmit,
      ),
    );
  }
}
