import { Product, CartItem } from '../models/Models';

// 模拟商品数据
export class DataService {
  private static products: Product[] = [
    new Product(1, '华为手机 Mate 60', '最新款华为旗舰手机，搭载鸿蒙系统', 6999, 'https://via.placeholder.com/200', '电子产品', 100),
    new Product(2, 'MatePad Pro', '鸿蒙平板电脑，办公娱乐两不误', 4999, 'https://via.placeholder.com/200', '电子产品', 50),
    new Product(3, 'HUAWEI WATCH GT 4', '智能手表，健康助手', 1888, 'https://via.placeholder.com/200', '智能穿戴', 200),
    new Product(4, 'FreeBuds Pro 3', '主动降噪耳机，音质出众', 1499, 'https://via.placeholder.com/200', '智能穿戴', 150),
    new Product(5, 'MateBook X Pro', '轻薄笔记本，高性能办公', 8999, 'https://via.placeholder.com/200', '电脑', 80),
    new Product(6, '鸿蒙智能家居套装', '智能家居控制中心', 2999, 'https://via.placeholder.com/200', '智能家居', 120),
  ];

  private static cartItems: CartItem[] = [];

  // 获取所有商品
  static getAllProducts(): Product[] {
    return this.products;
  }

  // 根据分类获取商品
  static getProductsByCategory(category: string): Product[] {
    return this.products.filter(p => p.category === category);
  }

  // 根据ID获取商品
  static getProductById(id: number): Product | undefined {
    return this.products.find(p => p.id === id);
  }

  // 获取所有分类
  static getCategories(): string[] {
    const categories = new Set(this.products.map(p => p.category));
    return Array.from(categories);
  }

  // 添加到购物车
  static addToCart(product: Product, quantity: number = 1): void {
    const existingItem = this.cartItems.find(item => item.product.id === product.id);
    if (existingItem) {
      existingItem.quantity += quantity;
    } else {
      this.cartItems.push(new CartItem(product, quantity));
    }
  }

  // 获取购物车商品
  static getCartItems(): CartItem[] {
    return this.cartItems;
  }

  // 更新购物车商品数量
  static updateCartItemQuantity(productId: number, quantity: number): void {
    const item = this.cartItems.find(item => item.product.id === productId);
    if (item) {
      if (quantity <= 0) {
        this.removeFromCart(productId);
      } else {
        item.quantity = quantity;
      }
    }
  }

  // 从购物车移除商品
  static removeFromCart(productId: number): void {
    const index = this.cartItems.findIndex(item => item.product.id === productId);
    if (index > -1) {
      this.cartItems.splice(index, 1);
    }
  }

  // 清空购物车
  static clearCart(): void {
    this.cartItems = [];
  }

  // 获取购物车总价
  static getCartTotal(): number {
    return this.cartItems.reduce((total, item) => total + item.getTotalPrice(), 0);
  }

  // 获取购物车商品数量
  static getCartItemCount(): number {
    return this.cartItems.reduce((count, item) => count + item.quantity, 0);
  }
}
