
import '../models/subasta.dart';

class DatosPrueba {
  static final List<Subasta> subastas = [
    Subasta(
      id: '1',
      titulo: 'Cámara fotográfica',
      descripcion:
          'Cámara digital en excelente estado, ideal para capturar momentos especiales. Donada para apoyar iniciativas solidarias.',
      imagen: 'assets/images/camara.png',
      ofertaActual: 1250,
      ofertaInicial: 900,
      ofertas: 8,
      fechaCierre: DateTime.now().add(const Duration(hours: 2, minutes: 35)),
      vendedorId: 'u1',
      categoria: 'Tecnología',
    ),
    Subasta(
      id: '2',
      titulo: 'Bicicleta urbana',
      descripcion:
          'Bicicleta para recorridos urbanos, cómoda y lista para utilizar.',
      imagen: 'assets/images/bicicleta.png',
      ofertaActual: 1850,
      ofertaInicial: 1200,
      ofertas: 12,
      fechaCierre: DateTime.now().add(const Duration(hours: 5, minutes: 10)),
      vendedorId: 'u2',
      categoria: 'Deportes',
    ),

    Subasta(
      id: '3',
      titulo: 'Reloj clásico',
      descripcion:
          'Reloj de diseño clásico y elegante. Una excelente pieza para colección.',
      imagen: 'assets/images/reloj.png',
      ofertaActual: 780,
      ofertaInicial: 500,
      ofertas: 5,
      fechaCierre: DateTime.now().add(const Duration(days: 1)),
      vendedorId: 'u3',
      categoria: 'Accesorios',
    ),

    Subasta(
      id: '4',
      titulo: 'Colección de libros',
      descripcion:
          'Lote de libros variados en buen estado para lectores de todas las edades.',
      imagen: 'assets/images/libros.png',
      ofertaActual: 420,
      ofertaInicial: 250,
      ofertas: 6,
      fechaCierre: DateTime.now().add(const Duration(hours: 8, minutes: 20)),
      vendedorId: 'u4',
      categoria: 'Libros',
    ),

    Subasta(
      id: '5',
      titulo: 'Guitarra acústica',
      descripcion:
          'Guitarra acústica para principiantes y aficionados a la música.',
      imagen: 'assets/images/guitarra.png',
      ofertaActual: 2100,
      ofertaInicial: 1500,
      ofertas: 9,
      fechaCierre: DateTime.now().add(const Duration(hours: 3, minutes: 45)),
      vendedorId: 'u5',
      categoria: 'Música',
    ),

    Subasta(
      id: '6',
      titulo: 'Silla decorativa',
      descripcion:
          'Silla auxiliar de estilo contemporáneo, funcional y decorativa.',
      imagen: 'assets/images/silla.png',
      ofertaActual: 650,
      ofertaInicial: 400,
      ofertas: 3,
      fechaCierre: DateTime.now().add(const Duration(hours: 12)),
      vendedorId: 'u6',
      categoria: 'Hogar',
    ),
  ];

  static final List<String> seguidas = ['1', '3', '5'];

  static final List<Subasta> historial = [
    Subasta(
      id: '7',
      titulo: 'Audífonos inalámbricos',
      descripcion: 'Subasta finalizada. Ganadora: María López.',
      imagen: 'assets/images/camara.png',
      ofertaActual: 950,
      ofertaInicial: 400,
      ofertas: 11,
      fechaCierre: DateTime.now().subtract(const Duration(days: 2)),
      vendedorId: 'u1',
      categoria: 'Tecnología',
    ),
  ];
}