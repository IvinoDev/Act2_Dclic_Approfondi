import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/endroits_utilisateurs.dart';
import '../widgets/image_prise.dart';

class ajout_endroit extends ConsumerStatefulWidget {
  const ajout_endroit({super.key});

  @override
  ConsumerState<ajout_endroit> createState() => _ajout_endroitState();
}

class _ajout_endroitState extends ConsumerState<ajout_endroit> {
  final _titreController = TextEditingController();
  File? _imageSelectionnee;

  void _selectionImage(File image) {
    _imageSelectionnee = image;
  }

  void _sauvegarderEndroit() {
    if (_titreController.text.isEmpty || _imageSelectionnee == null) {
      return;
    }

    ref
        .read(endroitsprovider.notifier)
        .ajoutendroit(_titreController.text, _imageSelectionnee!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un nouvel endroit')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Titre de l\'endroit',
                prefixIcon: Icon(Icons.place),
              ),
              controller: _titreController,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 24),
            // Image Input
            image_prise(onphotoselectionne: _selectionImage),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _sauvegarderEndroit,
              icon: const Icon(Icons.add),
              label: const Text('Ajouter cet endroit'),
              style: ElevatedButton.styleFrom(
                elevation: 4,
                shadowColor: Theme.of(context).colorScheme.shadow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
