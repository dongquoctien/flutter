# fultter_hello

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Day 2
Learn Stateful & Stateless Widget
- StatelessWidget

StatelessWidget hiểu nôm na là Widget tĩnh và nó không thể tự thay đổi được những gì mà nó hiển thị sau khi đã được Render xong (hardcode).
Tuy StatelessWidget không thể tự thay đổi được chính nó, nhưng khi Widget cha thay đổi thì StatelessWidget sẽ được khởi tạo lại.
Sử dụng trong StatefulWidget (cái này mình sẽ nói ở phần sau) để khi StatefulWidget thay đổi trạng thái thì các item con sẽ được render lại.

- StatefulWidget

Khác với StatelessWidget thì StatefulWidget là 1 Widget động và nó có thể thay đổi những gì đang hiển thị bằng cách thay đổi State của chính nó.
Widget này cần hàm State<StatefulWidget> createState() để cung cấp State cho StatefulWidget.
StatefulWidget cung cấp phương thức setState() để bạn có thể thay đổi State của class. Hiểu đơn giản là khi bạn muốn Update UI của StatefulWidget thì cần gọi phương thức setState() để thông báo cho StatefullWidget là tôi muốn bạn UpdateUI. Tất nhiên bạn có thể gọi setState() nhiều lần mỗi khi cần thay đổi UI trong vòng đời của ứng dụng.
