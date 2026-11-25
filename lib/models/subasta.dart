class Subasta {
  final String id;
  final String titulo;
  final String descripcion;
  final String imagen;
  final double ofertaActual;
  final double ofertaInicial;
  final int ofertas;
  final DateTime fechaCierre;
  final String vendedorId;
  final String categoria;

  const Subasta({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.imagen,
    required this.ofertaActual,
    required this.ofertaInicial,
    required this.ofertas,
    required this.fechaCierre,
    required this.vendedorId,
    required this.categoria,
  });

  bool get finalizada => DateTime.now().isAfter(fechaCierre);

  String get tiempoRestante {
    final resto = fechaCierre.difference(DateTime.now());
    if (resto.isNegative) return 'Finalizada';
    if (resto.inDays >= 1) {
      return '${resto.inDays} día${resto.inDays == 1 ? '' : 's'}';
    }
    final h = resto.inHours.toString().padLeft(2, '0');
    final m = (resto.inMinutes % 60).toString().padLeft(2, '0');
    return '$h h $m min';
  }

  Subasta copyWith({double? ofertaActual, int? ofertas}) => Subasta(
        id: id,
        titulo: titulo,
        descripcion: descripcion,
        imagen: imagen,
        ofertaActual: ofertaActual ?? this.ofertaActual,
        ofertaInicial: ofertaInicial,
        ofertas: ofertas ?? this.ofertas,
        fechaCierre: fechaCierre,
        vendedorId: vendedorId,
        categoria: categoria,
      );
}