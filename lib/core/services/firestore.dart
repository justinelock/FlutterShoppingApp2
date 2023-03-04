import '../models/banner.dart';
import '../models/category.dart';
import '../models/category_product.dart';
import '../models/query_snapshot.dart';

class FireCloudStore {
  static Stream<QuerySnapshot<Category>> category() async* {
    List<Category> list = [];
    list.add(Category(
        id: 1,
        image: 'https://lzd-img-global.slatic.net/g/p/4d55289bfc3373ea86e999f9edfa28a1.jpg_720x720q80.jpg',
        name: 'Wine',
        description: 'Department Store Liquor'));
    list.add(Category(
        id: 2,
        image: 'https://lzd-img-global.slatic.net/g/p/2d6cf094c170ff72647f772c07cb2735.jpg_720x720q80.jpg',
        name: 'Beauty',
        description: 'Beauty salon'));
    QuerySnapshot<Category> querySnapshot = QuerySnapshot();
    querySnapshot.entities = list;
    //querySnapshot.size = list.length;
    yield querySnapshot;
  }

  static Stream<QuerySnapshot<Banners>> banner() async* {
    List<Banners> list = [];
    list.add(Banners(
      id: 1,
      image: 'https://img.alicdn.com/imgextra/i1/O1CN01ZNZa2n206uSAFxr6p_!!6000000006801-0-tps-2880-800.jpg',
    ));
    list.add(Banners(
      id: 2,
      image: 'https://img.alicdn.com/imgextra/i2/O1CN01nK3gM51obnmPoUgiC_!!6000000005244-2-tps-2880-800.png',
    ));
    list.add(Banners(
      id: 3,
      image: 'https://img.alicdn.com/imgextra/i3/O1CN01hA29ez1iPzsPs3NTC_!!6000000004406-0-tps-2880-800.jpg',
    ));
    QuerySnapshot<Banners> querySnapshot = QuerySnapshot();
    querySnapshot.entities = list;
    //querySnapshot.size = list.length;
    yield querySnapshot;
  }

  static Stream<QuerySnapshot<CategoryProduct>> exclusive() async* {
    List<CategoryProduct> list = [];
    list.add(CategoryProduct(
      id: 1,
      image: 'https://ossfruits.oss-cn-hongkong.aliyuncs.com/fruits/img/www/upload/image/20190704/1562228617336078196.jpg',
      name: 'Gold joy lemon 1\$ purchase',
      description: 'A sour taste like youth',
      price: 120.50,
    ));
    list.add(CategoryProduct(
      id: 2,
      image: 'https://oss.oorchard.com/fruits/img/www/upload/image/20210601/1622523890559072112.png',
      name: 'Korean Crispy Persimmons',
      description: 'sweet and fragrant persimmon',
      price: 111.50,
    ));
    QuerySnapshot<CategoryProduct> querySnapshot = QuerySnapshot();
    querySnapshot.entities = list;
    //querySnapshot.size = list.length;
    yield querySnapshot;
  }

  static Stream<QuerySnapshot<CategoryProduct>> groceries() async* {
    List<CategoryProduct> list = [];
    list.add(CategoryProduct(
      id: 3,
      image: 'https://ossfruits.oss-cn-hongkong.aliyuncs.com/fruit/img/202301/376677693853765.png',
      name: 'FCL of Australian peaches',
      description: 'I want to give you a peach-like autumn',
      price: 120.50,
    ));
    list.add(CategoryProduct(
      id: 4,
      image: 'https://oss.oorchard.com/fruits/img/www/upload/image/20210511/1620716052302033824.jpg',
      name: 'Australian White Peach',
      description: 'The inseparable sweetness of peach',
      price: 340.00,
    ));
    QuerySnapshot<CategoryProduct> querySnapshot = QuerySnapshot();
    querySnapshot.entities = list;
    //querySnapshot.size = list.length;
    yield querySnapshot;
  }

  static Stream<QuerySnapshot<CategoryProduct>> topSeller() async* {
    List<CategoryProduct> list = [];
    list.add(CategoryProduct(
      id: 4,
      image: 'https://ossfruits.oss-cn-hongkong.aliyuncs.com/fruit/img/202301/374571905126469.jpg',
      name: 'cantaloupe ',
      description: 'Crisp, sweet and fragrant, tender flesh',
      price: 120.50,
    ));
    list.add(CategoryProduct(
      id: 5,
      image: 'https://ossfruits.oss-cn-hongkong.aliyuncs.com/fruit/img/202301/378475329945669.png',
      name: 'Cow 3 netted melon whole box',
      description: 'The Light of Domestic Products, Melon World LV',
      price: 1650.50,
    ));
    QuerySnapshot<CategoryProduct> querySnapshot = QuerySnapshot();
    querySnapshot.entities = list;
    //querySnapshot.size = list.length;
    yield querySnapshot;
  }

  static Stream<QuerySnapshot<CategoryProduct>> categoryProducts(String id) async* {
    List<CategoryProduct> list = [];
    list.add(CategoryProduct(
      id: 7,
      image: 'https://oss.oorchard.com/fruits/img/www/upload/image/20210120/1611112245795045858.jpg',
      name: 'Pakistani oranges',
      description: 'A good feeling, pure natural taste',
      price: 1200.00,
    ));
    list.add(CategoryProduct(
      id: 8,
      image: 'https://oss.oorchard.com/fruits/img/www/upload/image/20191023/1571824151941032039.jpg',
      name: 'Nanfeng Tribute Orange',
      description: 'Golden fruit color, thin skin and tender meat',
      price: 120.50,
    ));
    QuerySnapshot<CategoryProduct> querySnapshot = QuerySnapshot();
    querySnapshot.entities = list;
    //querySnapshot.size = list.length;
    yield querySnapshot;
  }
}
