import 'package:shop_app/data/models/comment.dart';
import 'package:shop_app/data/models/product.dart';

class ProductsDataSource {
  Future<List<Product>> loadAllProducts() =>
      Future.delayed(Duration(seconds: 2)).then((_) => _dataStub);
}

const _stubComments = <Comment>[
  Comment(4.5, 'Борис Анатолиевич', 'Отличная соковыжималка!'),
  Comment(3, 'Вероника', 'Порезалась, требую возврат!'),
  Comment(5, 'Кукуся', 'Я всем довольна.'),
  Comment(1, 'Виталик', ''),
];
const _dataStub = <Product>[
  Product(
      images: [
        'https://hotline.ua/img/tx/202/2024918405.jpg',
        'https://i1.foxtrot.com.ua/product/MediumImages/6403617_0.jpg',
        'https://stylus.ua/thumbs/390x390/99/2b/839417.jpeg'
      ],
      price: 1234,
      comments: _stubComments,
      title: 'Соковыжималка центробежная MAGIO MG-192',
      description:
          '''Универсальная соковыжималка Magio MG-192— это сочетание ультрамодного дизайна и высочайшего качества исполнения.

Пиковая мощность 800 Вт, два регулятора скорости, система защиты от перегрева, эффективный отжим сока — все это гарантирует вам отличный результат.
А прорезиненные ножки надежно удерживают прибор на поверхности стола. Высокая скорость вращения позволяет получать максимальное количество сока даже из твердых овощей или фруктов.'''),
  Product(
    images: [
      'https://i1.rozetka.ua/goods/8715585/ardesto_jeg_1000_images_8715585254.jpg',
      'https://img.moyo.ua/img/gallery/4273/8/784749_middle.jpg?1550757105',
      'https://ardesto.com.ua/wp-content/uploads/2018/11/JEG-1000-4-600x400.jpg'
    ],
    price: 1000,
    comments: _stubComments,
    title: 'Соковыжималка центробежная ARDESTO JEG-1000',
    description: '',
  ),
  Product(
      images: [
        'https://i2.rozetka.ua/goods/12985698/philips_avance_collection_hr1918_82_images_12985698270.jpg',
        'https://i2.rozetka.ua/goods/2267599/philips_hr1919_70_images_2267599544.jpg',
        'https://i2.rozetka.ua/goods/1638447/3467214_images_1638447318.jpg'
      ],
      price: 1500,
      oldPrice: 2000,
      comments: _stubComments,
      title: 'Соковыжималка центробежная PHILIPS Avance Collection HR1918/82',
      description: ''),
  Product(
      images: [
        'https://i2.rozetka.ua/goods/11556907/electrolux_ecj1_4gb_images_11556907316.jpg',
      ],
      price: 1300,
      oldPrice: 2300,
      comments: _stubComments,
      title: 'Соковыжималка центробежная ELECTROLUX ECJ1-4GB',
      description:
          '''Благодаря тому что отверстие для ингредиентов расширено, Вам не придется тратить время на их предварительную подготовку. Поместится даже целое яблоко!

Сепаратор вращается в обоих направлениях чтобы отделить каждую каплю драгоценного сока от мякоти.
2 режима мощности позволят выжать сок из любых ингредиентов от самых деликатных фруктов до сырых и твердых овощей.
Выбирайте мощность высокую или пониженную и наслаждайтесь полезным соком в любое время.'''),
];
