class Subasta {
  final String id;
  final String titulo;
  final String descripcion;
  final String imagen;
  final double ofertaActual;
  final double ofertaInicial;
  final int ofertas;
  final String tiempoRestante;
  final String categoria;
  final bool finalizada;

  const Subasta({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.imagen,
    required this.ofertaActual,
    required this.ofertaInicial,
    required this.ofertas,
    required this.tiempoRestante,
    required this.categoria,
    this.finalizada = false,
  });

  Subasta copyWith({double? ofertaActual, int? ofertas, bool? finalizada}) => Subasta(
    id: id, titulo: titulo, descripcion: descripcion, imagen: imagen,
    ofertaActual: ofertaActual ?? this.ofertaActual,
    ofertaInicial: ofertaInicial, ofertas: ofertas ?? this.ofertas,
    tiempoRestante: tiempoRestante, categoria: categoria,
    finalizada: finalizada ?? this.finalizada,
  );
}
