import '../models/oferta.dart';
import '../models/subasta.dart';
import 'datos_prueba.dart';

class OfertaInvalidaException implements Exception {
  final String mensaje;
  OfertaInvalidaException(this.mensaje);

  @override
  String toString() => mensaje;
}

class SubastaService {
  static final SubastaService _instancia = SubastaService._();
  factory SubastaService() => _instancia;
  SubastaService._();

  final List<Subasta> _subastas = [
    ...DatosPrueba.subastas,
    ...DatosPrueba.historial,
  ];
  final List<Oferta> _ofertas = [];

  Future<void> _retardo() =>
      Future.delayed(const Duration(milliseconds: 600));

  Future<List<Subasta>> obtenerSubastas() async {
    await _retardo();
    return _subastas.where((s) => !s.finalizada).toList();
  }

  Future<List<Subasta>> obtenerHistorial() async {
    await _retardo();
    return _subastas.where((s) => s.finalizada).toList();
  }

  Future<Subasta?> obtenerPorId(String id) async {
    await _retardo();
    for (final s in _subastas) {
      if (s.id == id) return s;
    }
    return null;
  }

  Future<void> publicarSubasta(Subasta subasta) async {
    await _retardo();
    _subastas.add(subasta);
  }

  Future<void> actualizarSubasta(Subasta subasta) async {
    await _retardo();
    final i = _subastas.indexWhere((s) => s.id == subasta.id);
    if (i == -1) throw Exception('La subasta ya no existe.');
    _subastas[i] = subasta;
  }

  Future<void> eliminarSubasta(String id) async {
    await _retardo();
    _subastas.removeWhere((s) => s.id == id);
  }

  Future<List<Oferta>> obtenerOfertas(String subastaId) async {
    await _retardo();
    return _ofertas.where((o) => o.subastaId == subastaId).toList();
  }

  Future<Subasta> ofertar({
    required String subastaId,
    required String usuarioId,
    required String nombreUsuario,
    required double monto,
  }) async {
    await _retardo();
    final i = _subastas.indexWhere((s) => s.id == subastaId);
    if (i == -1) throw OfertaInvalidaException('La subasta ya no existe.');

    final subasta = _subastas[i];
    if (subasta.finalizada) {
      throw OfertaInvalidaException('Esta subasta ya finalizó.');
    }
    if (monto <= subasta.ofertaActual) {
      throw OfertaInvalidaException(
        'Tu oferta debe superar L ${subasta.ofertaActual.toStringAsFixed(0)}.',
      );
    }

    _ofertas.add(Oferta(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      subastaId: subastaId,
      usuarioId: usuarioId,
      nombreUsuario: nombreUsuario,
      monto: monto,
      fecha: DateTime.now(),
    ));
    final actualizada = subasta.copyWith(
      ofertaActual: monto,
      ofertas: subasta.ofertas + 1,
    );
    _subastas[i] = actualizada;
    return actualizada;
  }
}