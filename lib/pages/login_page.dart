import 'package:flutter/material.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onEntrar;
  const LoginPage({super.key, required this.onEntrar});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _registro = false;
  bool _verPassword = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 92,
                      width: 92,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: const Icon(
                        Icons.volunteer_activism,
                        color: Colors.white,
                        size: 52,
                      ),
                    ),
                    const SizedBox(height: 22),
                    Text(
                      'Subasta Solidaria',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Cada oferta puede convertirse en una gran ayuda.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SegmentedButton<bool>(
                      segments: const [
                        ButtonSegment(
                          value: false,
                          label: Text('Iniciar sesión'),
                        ),
                        ButtonSegment(
                          value: true,
                          label: Text('Registrarme'),
                        ),
                      ],
                      selected: {_registro},
                      onSelectionChanged: (value) =>
                          setState(() => _registro = value.first),
                    ),
                    const SizedBox(height: 22),
                    if (_registro) ...[
                      AppTextField(
                        label: 'Nombre completo',
                        icon: Icons.person_outline,
                        validator: (value) => value == null || value.trim().length < 3
                            ? 'Ingresa tu nombre completo'
                            : null,
                      ),
                      const SizedBox(height: 14),
                    ],
                    AppTextField(
                      label: 'Correo electrónico',
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value == null ||
                              !RegExp(r'^[^@]+@[^@]+\.[^@]+$')
                                  .hasMatch(value.trim())
                          ? 'Ingresa un correo válido'
                          : null,
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      obscureText: !_verPassword,
                      validator: (value) => value == null || value.length < 6
                          ? 'La contraseña debe tener al menos 6 caracteres'
                          : null,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          onPressed: () =>
                              setState(() => _verPassword = !_verPassword),
                          icon: Icon(
                            _verPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      texto: _registro ? 'Crear cuenta' : 'Entrar',
                      icono: _registro
                          ? Icons.person_add_alt_1
                          : Icons.login,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          widget.onEntrar();
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Versión académica: acceso de demostración con datos locales.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
