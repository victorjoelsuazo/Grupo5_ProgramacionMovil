# Subasta Solidaria

Aplicación móvil académica desarrollada con Flutter y Dart para publicar artículos donados, recibir ofertas y apoyar iniciativas solidarias.

## Avance de Persona B – Semana 1

- Pantallas de acceso/registro, inicio, detalle de subasta, publicación, siguiendo e historial.
- Datos locales de demostración para las subastas.
- Grilla adaptable con `LayoutBuilder` (1, 2, 3 o 4 columnas según el ancho disponible).
- Formularios con validaciones para acceso, registro y publicación de artículos.
- Tema visual propio: vino `#8F1738`, blanco y fondos cálidos claros.
- Imágenes locales en `assets/images/`, declaradas en `pubspec.yaml`.
- Widgets reutilizables: `SubastaCard`, `AppButton` y `AppTextField`.
- Navegación inferior en teléfono y `NavigationRail` en pantallas anchas.

## Ejecutar

1. Instalar Flutter y configurar un emulador o dispositivo.
2. Desde la raíz del proyecto ejecutar `flutter pub get`.
3. Ejecutar `flutter run`.

## Nota de alcance

Esta versión utiliza datos de prueba locales. El inicio de sesión y las ofertas son demostrativos; todavía no se conectan a Firebase. La integración con los servicios reales se realizará en las siguientes etapas del proyecto.
