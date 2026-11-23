import 'package:flutter/material.dart';
import '../models/subasta.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class DetallePage extends StatefulWidget { final Subasta subasta; final VoidCallback onVolver; final bool siguiendo; final VoidCallback onToggleSeguir; const DetallePage({super.key,required this.subasta,required this.onVolver,required this.siguiendo,required this.onToggleSeguir}); @override State<DetallePage> createState()=>_DetallePageState(); }
class _DetallePageState extends State<DetallePage> {
  final _formKey=GlobalKey<FormState>(); final _oferta=TextEditingController(); late double _actual;
  @override void initState(){super.initState();_actual=widget.subasta.ofertaActual;}
  @override void dispose(){_oferta.dispose();super.dispose();}
  @override Widget build(BuildContext context){final s=widget.subasta;return Scaffold(appBar:AppBar(title:const Text('Detalle de subasta'),leading:IconButton(onPressed:widget.onVolver,icon:const Icon(Icons.arrow_back))),body:Center(child:ConstrainedBox(constraints:const BoxConstraints(maxWidth:900),child:ListView(padding:const EdgeInsets.all(20),children:[
    ClipRRect(borderRadius:BorderRadius.circular(20),child:AspectRatio(aspectRatio:16/9,child:Image.asset(s.imagen,fit:BoxFit.cover))),const SizedBox(height:20),Text(s.titulo,style:Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight:FontWeight.bold)),const SizedBox(height:8),Text(s.descripcion),const SizedBox(height:14),OutlinedButton.icon(onPressed:widget.onToggleSeguir,icon:Icon(widget.siguiendo?Icons.favorite:Icons.favorite_border),label:Text(widget.siguiendo?'Estás siguiendo esta subasta':'Seguir esta subasta ❤️')),const SizedBox(height:22),Card(child:Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[const Text('OFERTA ACTUAL'),Text('L ${_actual.toStringAsFixed(0)}',style:Theme.of(context).textTheme.headlineLarge?.copyWith(color:Theme.of(context).colorScheme.primary,fontWeight:FontWeight.bold)),Row(children:[const Icon(Icons.gavel,size:18),const SizedBox(width:6),Text('${s.ofertas} ofertas registradas'),const Spacer(),const Icon(Icons.schedule,size:18),const SizedBox(width:6),Text(s.tiempoRestante)])]))),
    const SizedBox(height:18),Form(key:_formKey,child:Column(children:[AppTextField(label:'Tu oferta en lempiras',icon:Icons.payments_outlined,controller:_oferta,keyboardType:const TextInputType.numberWithOptions(decimal:false),validator:(v){final n=double.tryParse(v??'');if(n==null)return'Ingresa un monto válido';if(n<=_actual)return'La oferta debe superar L ${_actual.toStringAsFixed(0)}';return null;}),const SizedBox(height:12),AppButton(texto:'Enviar oferta de prueba',icono:Icons.gavel,onPressed:(){if(_formKey.currentState!.validate()){setState(()=>_actual=double.parse(_oferta.text));_oferta.clear();ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Oferta registrada localmente.')));}})])),
  ]))));}
}
