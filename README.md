# 🚦 Flutter Traffic Light - Testes de Widget com Provider

Este projeto simula um semáforo (vermelho, amarelo, verde) e foi desenvolvido com o objetivo de **praticar testes de widget em Flutter**, utilizando as ferramentas e boas práticas da framework.

---

## 🧠 Estrutura do projeto

### 1. `TrafficLightViewmodel`

Gerencia o estado do semáforo usando `ChangeNotifier`. Usa `Timer` para simular o tempo entre as mudanças de luz.

```dart
final vm = context.watch<TrafficLightViewmodel>();
```

- `turnRed()` simula a transição verde ➝ amarelo ➝ vermelho com delay.
- `turnGreen()` ativa imediatamente a luz verde.
- Timer é cancelado com segurança no método `dispose`.

### 2. `TrafficLightPage`

A UI principal exibe os três sinais e dois botões: **Stop** e **Continue**.

- Cada luz (`LightWidget`) recebe uma `Key` (`Key('red_light')`, etc).
- Os botões também possuem `Key`s (`stop_btn`, `continue_btn`).

```dart
ElevatedButton(
  key: Key('stop_btn'),
  onPressed: () => vm.turnRed(),
  child: Text('Stop'),
)
```

### 3. `LightWidget`

Componente visual reutilizável que representa cada luz do semáforo. Usado com `Key` para facilitar inspeção nos testes.

```dart
LightWidget(
  key: Key('red_light'),
  lightColor: Colors.red,
  isActive: vm.isRed,
)
```

---

## 🧪 Testes

### Criação da tela de teste

Usamos um "wrapper" que monta o ambiente do app para os testes com Provider.

```dart
Widget createTrafficLightScreen() => ChangeNotifierProvider(
      create: (_) => TrafficLightViewmodel(),
      child: const MaterialApp(
        home: TrafficLightPage(),
      ),
    );
```

### Exemplo de teste

```dart
    testWidgets('Function for red traffic light', (tester) async {

      await tester.pumpWidget(createTrafficLightScreen());

      await tester.tap(find.byKey(Key('stop_btn')));
      await tester.pumpAndSettle();

      final red = tester.widget<LightWidget>(find.byKey(Key('red_light')));
      expect(red.lightColor, equals(Colors.red));
    });
```

- `tester.tap()` interage com os botões.
- `tester.pumpAndSettle()` aguarda animações e timers.
- `find.byKey()` encontra o widget.
- `expect(..., equals(...))` valida o comportamento esperado.

---

## 🧹 Boas práticas aplicadas

✅ Componentização de widgets  
✅ Uso de `Key` para facilitar testes  
✅ Isolamento da lógica no ViewModel  
✅ Cancelamento seguro de `Timer` com `dispose()`  
✅ Separação clara entre UI e lógica

---

## 📂 Estrutura de arquivos

```
lib/
├── main.dart
├── viewmodel/
│   └── traffic_light_viewmodel.dart
├── pages/
│   └── traffic_light_page.dart
├── widgets/
│   └── light_widget.dart
test/pages
└── traffic_light_test.dart
```

---

### ✅ Conceitos aprendidos:

- ✅ **Testes de Widget** com `testWidgets` e `WidgetTester`
- ✅ Uso de `pump`, `pumpAndSettle` e controle de tempo em testes
- ✅ **Identificação de widgets por Key** para facilitar a testabilidade
- ✅ Componente reutilizável `LightWidget` e como acessar suas propriedades no teste
- ✅ Uso de **Provider com ChangeNotifier** como `ViewModel`
- ✅ Criação de uma função como `createTrafficLightScreen()` para montar a árvore de widgets nos testes (também chamado de _test wrapper_)

---

Linkedin: https://www.linkedin.com/in/deviruy/

E-mail: yuri_trindade2016@hotmail.com