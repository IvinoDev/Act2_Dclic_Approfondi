import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modele/endroit.dart';

class endroits_utilisateur extends StateNotifier<List<Endroit>> {
  endroits_utilisateur() : super([]);

  void ajoutendroit(String nom, File image) {
    final nouveauEndroit = Endroit(nom: nom, image: image);
    state = [...state, nouveauEndroit];
  }
}

final endroitsprovider =
    StateNotifierProvider<endroits_utilisateur, List<Endroit>>(
      (ref) => endroits_utilisateur(),
    );
