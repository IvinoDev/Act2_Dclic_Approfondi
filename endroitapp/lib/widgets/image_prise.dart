import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class image_prise extends StatefulWidget {
  final void Function(File image) onphotoselectionne;

  const image_prise({super.key, required this.onphotoselectionne});

  @override
  State<image_prise> createState() => _image_priseState();
}

class _image_priseState extends State<image_prise> {
  File? _imageStockee;

  Future<void> _prendrePhoto() async {
    final picker = ImagePicker();
    final imageFichier = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (imageFichier == null) {
      return;
    }

    setState(() {
      _imageStockee = File(imageFichier.path);
    });

    widget.onphotoselectionne(_imageStockee!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
            ),
            color: Theme.of(
              context,
            ).colorScheme.surfaceVariant.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: _imageStockee != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GestureDetector(
                    onTap: _prendrePhoto,
                    child: Image.file(
                      _imageStockee!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                )
              : TextButton.icon(
                  onPressed: _prendrePhoto,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Prendre photo'),
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
        ),
      ],
    );
  }
}
