import 'dart:io';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Endroit {
  final String id;
  final String nom;
  final File image;

  Endroit({required this.nom, required this.image, String? id})
    : id = id ?? uuid.v4();
}
