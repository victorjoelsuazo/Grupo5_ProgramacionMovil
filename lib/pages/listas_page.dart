
import 'package:flutter/material.dart';
import '../models/subasta.dart';
import '../services/datos_prueba.dart';
import '../widgets/subasta_card.dart';

class ListaSubastasPage extends StatelessWidget {
  final bool historial;
  final ValueChanged<Subasta> onAbrir;
  final Set<String> seguidas;
  final ValueChanged<Subasta> onToggleSeguir;

  const ListaSubastasPage({
    super.key,
    required this.historial,
    required this.onAbrir,
    required this.seguidas,
    required this.onToggleSeguir,
  });

  @override
  Widget build(BuildContext context) {
    final lista = historial
        ? DatosPrueba.historial
        : DatosPrueba.subastas
            .where((s) => seguidas.contains(s.id))
            .toList();

    if (lista.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                historial ? Icons.history : Icons.favorite_border,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 12),
              Text(
                historial
                    ? 'Aquí encontrarás tus experiencias solidarias.'
                    : 'Todavía no sigues ninguna subasta.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 6),
              Text(
                historial
                    ? 'Gracias por ser parte de cada historia. ❤️'
                    : 'Guarda las que te inspiren tocando el corazón. ❤️',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final count = constraints.maxWidth >= 950
            ? 4
            : constraints.maxWidth >= 650
                ? 3
                : constraints.maxWidth >= 390
                    ? 2
                    : 1;

        return GridView.builder(
          padding: const EdgeInsets.all(14),
          itemCount: lista.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio:
                constraints.maxWidth < 390 ? 1.2 : 0.66,
          ),
          itemBuilder: (context, i) {
            final item = lista[i];

            return SubastaCard(
              subasta: item,
              onTap: () => onAbrir(item),
              mostrarTiempo: !historial,
              siguiendo: seguidas.contains(item.id),
              onToggleSeguir: () => onToggleSeguir(item),
            );
          },
        );
      },
    );
  }
}
