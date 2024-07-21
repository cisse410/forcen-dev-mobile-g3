import 'package:flutter/material.dart';
import 'package:tasks_manager_forcen/constants/app_colors.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);
  static const String routeName = '/profile-edit';

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Définissez ici les valeurs initiales des contrôleurs de texte
    _firstNameController.text = 'DJERABE';
    _lastNameController.text = 'Fabrice'; // Remplacez par la valeur actuelle du nom
    _emailController.text = 'fabrice@example.com'; // Remplacez par la valeur actuelle de l'email// Remplacez par la valeur actuelle de la bio

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: Colors.white,
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Prenom'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: Colors.white
                //primary: Colors.red, // Couleur de fond du bouton
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit),
                  SizedBox(width: 10,),
                  const Text('Edit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
