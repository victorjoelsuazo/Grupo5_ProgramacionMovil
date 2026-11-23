import 'package:flutter_test/flutter_test.dart';
import 'package:grupo5_programovil/main.dart';

void main() {
  testWidgets('Muestra el acceso de Subasta Solidaria', (tester) async {
    await tester.pumpWidget(const SubastaSolidariaApp());
    expect(find.text('Subasta Solidaria'), findsOneWidget);
    expect(find.text('Iniciar sesión'), findsOneWidget);
    expect(find.text('Registrarme'), findsOneWidget);
  });
}
