// 商品模型
export class Product {
  id: number;
  name: string;
  description: string;
  price: number;
  imageUrl: string;
  category: string;
  stock: number;

  constructor(id: number, name: string, description: string, price: number, 
              imageUrl: string, category: string, stock: number) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.price = price;
    this.imageUrl = imageUrl;
    this.category = category;
    this.stock = stock;
  }
}

// 购物车商品模型
export class CartItem {
  product: Product;
  quantity: number;

  constructor(product: Product, quantity: number) {
    this.product = product;
    this.quantity = quantity;
  }

  getTotalPrice(): number {
    return this.product.price * this.quantity;
  }
}

// 用户模型
export class User {
  id: number;
  username: string;
  avatar: string;

  constructor(id: number, username: string, avatar: string) {
    this.id = id;
    this.username = username;
    this.avatar = avatar;
  }
}
