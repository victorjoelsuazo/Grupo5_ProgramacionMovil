
import '../models/subasta.dart';

class DatosPrueba {
  static final List<Subasta> subastas = [
    const Subasta(
      id: '1',
      titulo: 'Cámara fotográfica',
      descripcion:
          'Cámara digital en excelente estado, ideal para capturar momentos especiales. Donada para apoyar iniciativas solidarias.',
      imagen: 'assets/images/camara.png',
      ofertaActual: 1250,
      ofertaInicial: 900,
      ofertas: 8,
      tiempoRestante: '02 h 35 min',
      categoria: 'Tecnología',
    ),
    const Subasta(
      id: '2',
      titulo: 'Bicicleta urbana',
      descripcion:
          'Bicicleta para recorridos urbanos, cómoda y lista para utilizar.',
      imagen: 'assets/images/bicicleta.png',
      ofertaActual: 1850,
      ofertaInicial: 1200,
      ofertas: 12,
      tiempoRestante: '05 h 10 min',
      categoria: 'Deportes',
    ),
    const Subasta(
      id: '3',
      titulo: 'Reloj clásico',
      descripcion:
          'Reloj de diseño clásico y elegante. Una excelente pieza para colección.',
      imagen: 'assets/images/reloj.png',
      ofertaActual: 780,
      ofertaInicial: 500,
      ofertas: 5,
      tiempoRestante: '1 día',
      categoria: 'Accesorios',
    ),
    const Subasta(
      id: '4',
      titulo: 'Colección de libros',
      descripcion:
          'Lote de libros variados en buen estado para lectores de todas las edades.',
      imagen: 'assets/images/libros.png',
      ofertaActual: 420,
      ofertaInicial: 250,
      ofertas: 6,
      tiempoRestante: '08 h 20 min',
      categoria: 'Libros',
    ),
    const Subasta(
      id: '5',
      titulo: 'Guitarra acústica',
      descripcion:
          'Guitarra acústica para principiantes y aficionados a la música.',
      imagen: 'assets/images/guitarra.png',
      ofertaActual: 2100,
      ofertaInicial: 1500,
      ofertas: 9,
      tiempoRestante: '03 h 45 min',
      categoria: 'Música',
    ),
    const Subasta(
      id: '6',
      titulo: 'Silla decorativa',
      descripcion:
          'Silla auxiliar de estilo contemporáneo, funcional y decorativa.',
      imagen: 'assets/images/silla.png',
      ofertaActual: 650,
      ofertaInicial: 400,
      ofertas: 3,
      tiempoRestante: '12 h 00 min',
      categoria: 'Hogar',
    ),
  ];

  static final List<String> seguidas = ['1', '3', '5'];

  static final List<Subasta> historial = [
    const Subasta(
      id: '7',
      titulo: 'Audífonos inalámbricos',
      descripcion: 'Subasta finalizada. Ganadora: María López.',
      imagen: 'assets/images/camara.png',
      ofertaActual: 950,
      ofertaInicial: 400,
      ofertas: 11,
      tiempoRestante: 'Finalizada',
      categoria: 'Tecnología',
      finalizada: true,
    ),
  ];
}
