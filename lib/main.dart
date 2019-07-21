import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

import 'package:flutterfitnesss/pages/calculadora_imc.dart';
import 'package:flutterfitnesss/pages/nosotros.dart';

void main(){
  runApp(
    MaterialApp(
      title: 'App Fitness',
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Creamos un arreglo de datos imagenes y nombre ejercicio
  List<Container> listamos = List();

  var arreglox = [
    {
      "nombre": "Pierna", 
      "imagen": "pierna2.jpg", 
      "ejercicio": "Trabajo con polea 4 repeticiones de 12"
    },
    {
      "nombre": "Pesas", 
      "imagen": "pesas.jpg", 
      "ejercicio": "Trabajo con pesas ..."
    },
    {
      "nombre": "Cinta Elastica", 
      "imagen": "cinta.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Cinta", 
      "imagen": "cinta2.jpg", 
      "ejercicio": "Trabajo con cinta 2 repeticiones de 15"
    },
    {
      "nombre": "Abdomen", 
      "imagen": "abdomen2.jpg", 
      "ejercicio": "Abdomen alto ..."
    },
    {
      "nombre": "Peso", 
      "imagen": "peso.jpg", 
      "ejercicio": "Trabajo pesas de 5 Kg"
    },
    {
      "nombre": "Pierna + Gluteos", 
      "imagen": "pierna2.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Gluteos", 
      "imagen": "gluteos.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Mas Gluteos", 
      "imagen": "gluteos2.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Pierna ...", 
      "imagen": "pierna.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Barra", 
      "imagen": "barra2.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Rusa", 
      "imagen": "rusa.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Pierna ...", 
      "imagen": "pierna3.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Cinta Elastica", 
      "imagen": "cinta.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Peso 2", 
      "imagen": "peso2.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Mancuernas", 
      "imagen": "mancuernas.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Estiramiento", 
      "imagen": "estiramiento.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Gluteos 4", 
      "imagen": "pierna2.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
    {
      "nombre": "Barra de 5K", 
      "imagen": "barra.jpg", 
      "ejercicio": "Trabajo con cinta 4 repeticiones de 15"
    },
  ];

  //=recorremos el arreglo

  _listado() async{
    for (var i = 0; i < arreglox.length; i++){
      final arregloxyz = arreglox[i];
      final String imagen = arregloxyz["imagen"];

      listamos.add(
        Container(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Column(
              children: <Widget>[
                Hero(
                  tag: arregloxyz['nombre'],
                  child: Material(
                    child: InkWell(
                      onTap: () => 
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Detalle(
                          nombre: arregloxyz['nombre'],
                          imagen: imagen,
                          deporte: arregloxyz['ejercicio'],
                        ),
                      )),
                      child: Image.asset(
                        "assets/images/$imagen",
                        fit: BoxFit.contain
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                ),
                Text(
                  arregloxyz['nombre'],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _listado();
    super.initState();
  }


  //creamos el layout o disenio
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness 2019'),
        backgroundColor: Colors.orange,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Ejercicios'),
              accountEmail: Text('codigoalpha@gmail.com'),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/g;uteos.jpg')
                ),
              ),
            ),

            Divider(),
            ListTile(
              title: Text("Calculadora IMC"),
              trailing: Icon(Icons.fitness_center),
              onTap: () => Navigator.of(context).push(MaterialPageRoute (
                builder: (BuildContext context) => CalcImc(),
              )),
            ),

            Divider(),
            ListTile(
              title: Text("Nosotros"),
              trailing: Icon(Icons.fitness_center),
              onTap: () => Navigator.of(context).push(MaterialPageRoute (
                builder: (BuildContext context) => Nosotros(),
              )),
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,  //numero de columnas
        mainAxisSpacing: 0.1,
        childAspectRatio: 0.700,
        children: listamos,
      ),
    );
  }
}

//creamos el metodo Detalle

class Detalle extends StatelessWidget {

  final String nombre;
  final String imagen;
  final String deporte;
  Detalle({this.nombre, this.imagen, this.deporte});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          Container(
            height: 240.0,
            child: Hero(
              tag: nombre,
              child: Material(
                child: InkWell(
                  child: Image.asset(
                    "assets/images/$imagen",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          IniciarNombre(
            nombre: nombre,
          ),
          IniciarIcon(),
          Informacion(
            deporte: deporte,
          ),
        ],
      ),
    );
  }
}

class IniciarNombre extends StatelessWidget {

  final String nombre;
  IniciarNombre({this.nombre});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nombre,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  "$nombre\@gmail.com",
                  style: TextStyle(
                     fontSize: 15.0,
                     color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
               Text(
                 "12",
                 style: TextStyle(
                   fontSize: 18.0,
                 ),
               ),
            ],
          ),
        ],
      ),
    );
  }
}

class IniciarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          IconTec(
            icon: Icons.call,
            tec: "call",
          ),
          IconTec(
            icon: Icons.message,
            tec: "WhastApp",
          ),
          IconTec(
            icon: Icons.photo,
            tec: "Foto",
          ),
        ],
      ),
    );
  }
}

class IconTec extends StatelessWidget {

  final IconData icon;
  final String tec;
  IconTec({this.icon, this.tec});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          Text(
            tec,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}


class Informacion extends StatelessWidget {

  final String deporte;
  Informacion({this.deporte});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            deporte,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}