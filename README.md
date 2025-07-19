# 💪 App Calculadora de IMC – iOS Lab

Este projeto foi desenvolvido como parte das atividades práticas do curso **Escola iOS Lab**, com o objetivo de aprender os conceitos fundamentais do **SwiftUI**, como o uso de `@State`, `ObservableObject`, `@Published`, `enum`, `switch`, `guard let`, além de aplicar lógica matemática para cálculo do **Índice de Massa Corporal (IMC)**.

> 🧑‍💻 Desenvolvedor: **Leandro Vansan de Morais**  
> 📅 Data: 18 de julho de 2025  
> 🏫 Curso: Escola iOS Lab  
> 🧠 Atividade: App de cálculo de IMC com categorias

---

## 🎯 Objetivo do Projeto

- Criar uma calculadora funcional de IMC com SwiftUI.
- Praticar conversão segura de dados com `guard let`.
- Aplicar lógica condicional com `switch case`.
- Explorar o uso de `enum` com métodos estáticos e de instância.
- Organizar o projeto usando `ObservableObject` e arquitetura MVVM simplificada.
- Criar uma interface moderna com `LinearGradient` e `glassEffect`.

---

## 🚀 Funcionalidades

- Entrada de **peso (kg)** e **altura (m)** via `TextField`.
- Cálculo do IMC com base na fórmula `peso / altura²`.
- Classificação automática do IMC em categorias da OMS:
  - Magreza grau III até Obesidade grau III.
- Exibição da categoria correspondente e do IMC com duas casas decimais.
- Design adaptável com efeito de vidro (glassmorphism).
- Suporte ao tema claro e escuro (Dark/Light Mode).

---

## 🧑‍🏫 Conceitos Aprendidos

### 🔹 `@State`
Permite que variáveis mutáveis como `weight`, `height` e `resultCalc` atualizem automaticamente a interface.  
📚 [Documentação oficial](https://developer.apple.com/documentation/swiftui/state)

### 🔹 `@ObservedObject` & `ObservableObject`
Permite a separação do estado da interface em um modelo externo (`BMIModel`) que pode ser observado por Views.  
Essa abordagem segue o padrão MVVM usado no app Landmarks.  
📚 [ObservableObject](https://developer.apple.com/documentation/combine/observableobject)  
📚 [ObservedObject](https://developer.apple.com/documentation/swiftui/observedobject)

### 🔹 `@Published`
Permite que variáveis dentro do `BMIModel` disparem atualizações automáticas na interface assim que mudam.  
📚 [Published](https://developer.apple.com/documentation/combine/published)

### 🔹 Separação de responsabilidade (Model + View)
O cálculo do IMC e o armazenamento dos dados foram movidos para uma classe separada (`BMIModel`), seguindo a filosofia da Apple de manter a View limpa e focada na interface.  
📚 [Landmarks App](https://developer.apple.com/documentation/swiftui/landmarks-building-an-app-with-liquid-glass)

### 🔹 `guard let`
Garante que a conversão de `String` para `Double` ocorra com segurança antes do cálculo.  
📚 [Swift guard](https://www.swift.org/documentation/#The-guard-Statement)

### 🔹 `enum` com método `static` e `instance`
Define as categorias de IMC com lógica de classificação usando `switch`.  
📚 [Documentação Enum Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations/)

### 🔹 `switch case`
Verifica em qual faixa o valor do IMC se encaixa, retornando a enum correspondente.  
📚 [Switch em Swift](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Switch)

### 🔹 `TextField` com `.keyboardType(.decimalPad)`
Permite entrada de dados numéricos com ponto decimal para o peso e altura.  
📚 [TextField SwiftUI](https://developer.apple.com/documentation/swiftui/textfield)

### 🔹 `LinearGradient`
Cria um fundo estilizado com cores que variam conforme o modo escuro ou claro.  
📚 [LinearGradient](https://developer.apple.com/documentation/swiftui/lineargradient)

### 🔹 `@Environment(\.colorScheme)`
Detecta automaticamente se o app está no tema escuro ou claro para ajustar a aparência.  
📚 [colorScheme](https://developer.apple.com/documentation/swiftui/environmentvalues/colorscheme)

### 🔹 `glassEffect` (NOVO iOS 26)
Adiciona um visual moderno translúcido nos campos de texto e botões.  
📚 [glassEffect](https://developer.apple.com/documentation/swiftui/view/glasseffect(_:in:))

---

## 🧮 Lógica de Cálculo do IMC

1. O usuário insere peso e altura como texto (`String`).
2. A função `calcular()` do modelo:
   - Usa `guard let` para converter as Strings para `Double`.
   - Aplica a fórmula do IMC: `peso / (altura * altura)`.
   - Atualiza a variável `resultado` automaticamente via `@Published`.
3. A função `BMI.category()` recebe o resultado e retorna uma categoria (`enum`).
4. O método `description()` do enum transforma o valor enum em uma descrição legível.

---

## 🛠️ Requisitos

- Swift 5.10+
- Xcode 16+
- iOS 18.0 ou iPadOS 18.0

---

## 📝 Observações

- Este projeto foi criado com fins educacionais, seguindo princípios nativos da arquitetura Apple.
- A estrutura de arquivos foi inspirada no app oficial **Landmarks**, com separação entre `Model`, `View`, e lógica de negócio.

---

## 💡 Próximos Passos

- Adicionar animações com `withAnimation` para transições de categoria.
- Refatorar para `MVVM-C` separando `ViewModel` e possíveis `Coordinator`.
- Implementar testes automatizados do cálculo.
- Publicar na App Store 🚀

---

> Projeto de estudante – em constante evolução 💼  
> **Use, aprenda, contribua!**
