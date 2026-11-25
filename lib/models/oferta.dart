class Oferta {
  final String id;
  final String subastaId;
  final String usuarioId;
  final String nombreUsuario;
  final double monto;
  final DateTime fecha;

  const Oferta({
    required this.id,
    required this.subastaId,
    required this.usuarioId,
    required this.nombreUsuario,
    required this.monto,
    required this.fecha,
  });
}