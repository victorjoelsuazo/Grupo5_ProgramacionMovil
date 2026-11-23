import 'package:flutter/material.dart';
import '../models/subasta.dart';

class SubastaCard extends StatelessWidget {
  final Subasta subasta;
  final VoidCallback onTap;
  final bool mostrarTiempo;
  final bool siguiendo;
  final VoidCallback onToggleSeguir;

  const SubastaCard({super.key, required this.subasta, required this.onTap,
    this.mostrarTiempo = true, this.siguiendo = false,
    required this.onToggleSeguir});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          InkWell(onTap: onTap, child: AspectRatio(aspectRatio: 1.55,
            child: Image.asset(subasta.imagen, fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: theme.colorScheme.surfaceContainerHighest,
                child: const Icon(Icons.image_not_supported, size: 42))))),
          Positioned(right: 9, top: 9, child: Material(
            color: Colors.white.withValues(alpha: .95), shape: const CircleBorder(),
            child: IconButton(
              tooltip: siguiendo ? 'Dejar de seguir' : 'Seguir subasta',
              onPressed: onToggleSeguir,
              icon: Icon(siguiendo ? Icons.favorite : Icons.favorite_border,
                color: theme.colorScheme.primary),
            ),
          )),
        ]),
        Padding(padding: const EdgeInsets.fromLTRB(12, 11, 12, 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(subasta.categoria.toUpperCase(), style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary, fontWeight: FontWeight.bold, letterSpacing: 1)),
            const SizedBox(height: 5),
            InkWell(onTap: onTap, child: Text(subasta.titulo, maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold))),
            const SizedBox(height: 9),
            Text('Oferta actual', style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant)),
            Text('L ${subasta.ofertaActual.toStringAsFixed(0)}',
              style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(children: [const Icon(Icons.gavel, size: 15), const SizedBox(width: 4),
              Text('${subasta.ofertas} ofertas'), const Spacer(),
              if (mostrarTiempo) const Icon(Icons.schedule, size: 15),
              if (mostrarTiempo) const SizedBox(width: 4),
              if (mostrarTiempo) Flexible(child: Text(subasta.tiempoRestante,
                overflow: TextOverflow.ellipsis, style: theme.textTheme.bodySmall))]),
            const SizedBox(height: 8),
            SizedBox(width: double.infinity, child: OutlinedButton.icon(
              onPressed: onToggleSeguir,
              icon: Icon(siguiendo ? Icons.favorite : Icons.favorite_border, size: 18),
              label: Text(siguiendo ? 'Siguiendo' : 'Seguir esta subasta'),
            )),
          ])),
      ]),
    );
  }
}
