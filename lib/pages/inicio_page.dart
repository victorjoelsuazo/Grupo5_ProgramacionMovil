import 'package:flutter/material.dart';
import '../models/subasta.dart';
import '../services/datos_prueba.dart';
import '../widgets/subasta_card.dart';

class InicioPage extends StatefulWidget {
  final ValueChanged<Subasta> onAbrir;
  final Set<String> seguidas;
  final ValueChanged<Subasta> onToggleSeguir;
  const InicioPage({super.key, required this.onAbrir, required this.seguidas,
    required this.onToggleSeguir});
  @override State<InicioPage> createState() => _InicioPageState();
}
class _InicioPageState extends State<InicioPage> {
  String _busqueda = ''; String _categoria = 'Todas'; String _orden = 'Recomendadas';
  @override Widget build(BuildContext context) {
    final categorias = ['Todas','Tecnología','Deportes','Accesorios','Libros','Música','Hogar'];
    var lista = DatosPrueba.subastas.where((s) =>
      (s.titulo.toLowerCase().contains(_busqueda) || s.categoria.toLowerCase().contains(_busqueda)) &&
      (_categoria == 'Todas' || s.categoria == _categoria)).toList();
    if (_orden == 'Menor oferta') lista.sort((a,b) => a.ofertaActual.compareTo(b.ofertaActual));
    if (_orden == 'Mayor oferta') lista.sort((a,b) => b.ofertaActual.compareTo(a.ofertaActual));
    return Scaffold(body: CustomScrollView(slivers: [
      SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.fromLTRB(18,18,18,8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('¡Qué bueno tenerte aquí! ❤️', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600)),
          const SizedBox(height: 7),
          Text('Encuentra algo especial', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          const Text('Cada oferta puede convertirse en una gran ayuda. Gracias por ser parte de esta causa.'),
          const SizedBox(height: 18),
          TextField(onChanged: (v) => setState(() => _busqueda = v.toLowerCase()),
            decoration: const InputDecoration(hintText: '¿Qué te gustaría encontrar?', prefixIcon: Icon(Icons.search), suffixIcon: Icon(Icons.tune))),
          const SizedBox(height: 13),
          SizedBox(height: 38, child: ListView.separated(scrollDirection: Axis.horizontal,
            itemCount: categorias.length, separatorBuilder: (_,__) => const SizedBox(width: 8),
            itemBuilder: (context,i) => ChoiceChip(label: Text(categorias[i]), selected: _categoria == categorias[i],
              onSelected: (_) => setState(() => _categoria = categorias[i])))),
          const SizedBox(height: 12),
          Row(children: [Text('${lista.length} artículos disponibles', style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)), const Spacer(),
            DropdownButton<String>(value: _orden, underline: const SizedBox(),
              items: ['Recomendadas','Menor oferta','Mayor oferta'].map((e) => DropdownMenuItem(value:e,child:Text(e,style:const TextStyle(fontSize:12)))).toList(),
              onChanged: (v) => setState(() => _orden = v!))]),
        ]))),
      if (lista.isEmpty) const SliverFillRemaining(hasScrollBody:false, child: Center(child: Padding(padding: EdgeInsets.all(24), child: Text('No encontramos lo que buscas. ¡Siempre hay algo especial por descubrir! ❤️', textAlign: TextAlign.center))))
      else SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.fromLTRB(14,4,14,24),
        child: LayoutBuilder(builder: (context,constraints) {
          final width = constraints.maxWidth; final count = width >= 1000 ? 4 : width >= 650 ? 3 : width >= 380 ? 2 : 1;
          return GridView.builder(shrinkWrap:true, physics:const NeverScrollableScrollPhysics(), itemCount:lista.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:count,crossAxisSpacing:12,mainAxisSpacing:12,childAspectRatio:count==1?0.94:0.62),
            itemBuilder:(context,i) { final item=lista[i]; return SubastaCard(subasta:item,onTap:()=>widget.onAbrir(item),
              siguiendo:widget.seguidas.contains(item.id),onToggleSeguir:()=>widget.onToggleSeguir(item)); });
        }))),
    ]));
  }
}
