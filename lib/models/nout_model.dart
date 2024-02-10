
class Products{
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  const Products({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
});

  @override
  String toString() {
    return 'Products{ name: $name,price: $price,';
  }
}

class CartItem{
final int id;
 int quantity;
 double total;
 final Products products;
 CartItem({
  required this.id,
   this.quantity = 1,
   required this.products,
}) : total = products.price * quantity;

 CartItem copyWith(int? id,int? quantity,Products? products){
     return CartItem(id: id ?? this.id, products: products ?? this.products,quantity: quantity ?? this.quantity);
 }

@override
  String toString() {
    return 'CartItem{ quantity: $quantity, total: $total, products: $products}';
  }
}

class Cart{

final int id;
List <CartItem> items;
double total;

Cart({required this.id,required this.items,}) : total = items.fold(0.0, (sum, element) => sum + element.total);

Cart copyWith({int? id, List <CartItem>? items,}){
  return Cart(id: id ?? this.id, items: items ?? this.items);
}

@override
  String toString() {
    return 'Cart{items: $items, total: $total}';
  }
}



List<Products> products = [
  const Products(id: 1, name: "OMEN Transcend Gaming Laptop 16t-u000, 16.1", description: "Good", price: 1299.99, imageUrl: "https://ssl-product-images.www8-hp.com/digmedialib/prodimg/lowres/c08499684.png"),
  const Products(id: 2, name: "PREDATOR TRITON 500 SE", description: "Good", price: 1999.99, imageUrl: "https://images.acer.com/is/image/acer/Triton-500-SE-PT516-51s-FP-Backliton-01a-1?\$Visual-Filter-XL\$"),
  const Products(id: 3, name: "Alienware m16 Gaming Laptop", description: "Nice", price: 2999.99, imageUrl: "https://i.dell.com/is/image/DellContent/content/dam/ss2/product-images/dell-client-products/notebooks/alienware-notebooks/alienware-m16-amd/media-gallery/usb-data/laptop-alienware-m16-amd-bk-usb-gallery-4.psd?fmt=png-alpha&pscan=auto&scl=1&hei=402&wid=637&qlt=100,1&resMode=sharp2&size=637,402&chrss=full"),
  const Products(id: 4, name: "Legion Pro 7 (8th Gen, 16, AMD)", description: "Nice", price: 2999.99, imageUrl: "https://www.lenovo.com/medias/?context=bWFzdGVyfHJvb3R8MjU1NTE0fGltYWdlL3BuZ3xoYzMvaDYyLzE2OTc0MDM1NjQ4NTQyLnBuZ3xiMDg1M2I4ZDU3ZTY3YTM4NTdlMDBjOTBjNGE0ZmUzMWMzMjBlZDYzZDcxMDE2NzAyNGUyMTk0MWRmZmU3MWZl"),
];