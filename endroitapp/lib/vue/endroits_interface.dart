import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/endroits_utilisateurs.dart';
import '../widgets/endroits_list.dart';
import 'ajout_endroit.dart';

class endroitsinterface extends ConsumerWidget {
  const endroitsinterface({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final endroits = ref.watch(endroitsprovider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes endroits préférés'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const ajout_endroit()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: endroits_list(endroits: endroits),
    );
  }
}
