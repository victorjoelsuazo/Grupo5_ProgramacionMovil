
import 'package:flutter/material.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class PublicarPage extends StatefulWidget {
  const PublicarPage({super.key});

  @override
  State<PublicarPage> createState() => _PublicarPageState();
}

class _PublicarPageState extends State<PublicarPage> {
  final _key = GlobalKey<FormState>();
  final _titulo = TextEditingController();
  final _descripcion = TextEditingController();
  final _precio = TextEditingController();

  String _categoria = 'Hogar';
  String _imagen = 'assets/images/silla.png';

  final Map<String, String> _imagenes = const {
    'assets/images/silla.png': 'Silla',
    'assets/images/camara.png': 'Cámara',
    'assets/images/bicicleta.png': 'Bicicleta',
    'assets/images/reloj.png': 'Reloj',
    'assets/images/libros.png': 'Libros',
    'assets/images/guitarra.png': 'Guitarra',
  };

  @override
  void dispose() {
    _titulo.dispose();
    _descripcion.dispose();
    _precio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 650),
          child: Form(
            key: _key,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  '¡Comparte algo especial! ❤️',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Cada artículo que compartes puede convertirse en una oportunidad para alguien más. ¡Gracias por ser parte de esta causa!',
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    _imagen,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: _imagen,
                  decoration: const InputDecoration(
                    labelText: 'Elige una imagen para tu donación',
                    prefixIcon: Icon(Icons.image_outlined),
                  ),
                  items: _imagenes.entries
                      .map(
                        (entry) => DropdownMenuItem<String>(
                          value: entry.key,
                          child: Text(entry.value),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _imagen = value);
                    }
                  },
                ),
                const SizedBox(height: 14),
                AppTextField(
                  label: '¿Qué artículo quieres compartir?',
                  icon: Icons.inventory_2_outlined,
                  controller: _titulo,
                  validator: (value) =>
                      value == null || value.trim().length < 3
                          ? 'Cuéntanos el nombre del artículo (mínimo 3 caracteres).'
                          : null,
                ),
                const SizedBox(height: 14),
                AppTextField(
                  label: 'Cuéntanos un poquito más sobre tu artículo',
                  icon: Icons.description_outlined,
                  controller: _descripcion,
                  maxLines: 3,
                  validator: (value) =>
                      value == null || value.trim().length < 10
                          ? 'Agrega un poquito más de información (mínimo 10 caracteres).'
                          : null,
                ),
                const SizedBox(height: 14),
                DropdownButtonFormField<String>(
                  initialValue: _categoria,
                  decoration: const InputDecoration(
                    labelText: '¿En qué categoría lo encontramos?',
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                  items: const [
                    'Hogar',
                    'Tecnología',
                    'Deportes',
                    'Accesorios',
                    'Libros',
                    'Música',
                  ]
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _categoria = value);
                    }
                  },
                ),
                const SizedBox(height: 14),
                AppTextField(
                  label: '¿Con cuánto te gustaría iniciar la subasta? (L)',
                  icon: Icons.payments_outlined,
                  controller: _precio,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  validator: (value) {
                    final amount = double.tryParse(value ?? '');
                    if (amount == null || amount <= 0) {
                      return 'Indica un monto inicial mayor que cero para continuar.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                const Text(
                  'El precio inicial es el punto de partida: las personas podrán realizar ofertas durante la subasta.',
                ),
                const SizedBox(height: 22),
                AppButton(
                  texto: 'Compartir mi donación',
                  icono: Icons.check_circle_outline,
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            '¡Gracias por compartir! ❤️ Tu donación está lista para convertirse en una oportunidad. (Vista de prueba: aún no se ha guardado).',
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
