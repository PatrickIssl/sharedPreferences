import 'package:mobx/mobx.dart';
part 'controller.g.dart';


class Controller = ControllerBase with _$Controller;


//a atualização do mixin Store é para geração dos códigos automáticos
abstract class ControllerBase with Store{

  @observable
  int contador = 0;

  @action
  incrementar(){
    contador++;
  }


  // var _contador = Observable(0);
  // Action incrementar;
  //
  // Controller(){
  //   incrementar = Action(_incrementar);
  // }
  //
  // int get contador => _contador.value;
  //
  // set contador(int novoValor) => _contador.value = novoValor;
  //
  // _incrementar(){
  // //  _contador.value = _contador.value +1;
  //    contador++;
  // }

}