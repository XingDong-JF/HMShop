# HMShop - 鸿蒙商城应用

基于鸿蒙（HarmonyOS）开发的商城应用，使用 ArkTS 语言开发。

## 项目简介

HMShop 是一个完整的鸿蒙商城应用示例，展示了鸿蒙应用开发的最佳实践。应用包含了商城应用的核心功能，包括商品浏览、分类筛选、购物车管理等。

## 功能特性

### 已实现功能

- ✅ **首页展示**：包含轮播图、商品分类快捷入口、推荐商品展示
- ✅ **商品分类**：按类别浏览商品
- ✅ **商品列表**：展示特定分类下的所有商品
- ✅ **商品详情**：查看商品详细信息、选择购买数量
- ✅ **购物车管理**：添加商品到购物车、修改数量、删除商品
- ✅ **个人中心**：用户信息展示、订单管理入口、功能设置

### 技术特点

- 🎨 使用 ArkTS 声明式 UI 开发
- 📱 响应式布局设计
- 🧭 页面路由导航
- 💾 本地数据管理
- 🎯 组件化开发

## 项目结构

```
HMShop/
├── AppScope/                      # 应用全局配置
│   ├── app.json5                  # 应用配置文件
│   └── resources/                 # 全局资源
├── entry/                         # 主模块
│   └── src/
│       └── main/
│           ├── ets/               # ArkTS 源码
│           │   ├── entryability/  # 应用入口
│           │   │   └── EntryAbility.ets
│           │   ├── pages/         # 页面
│           │   │   ├── Index.ets          # 首页
│           │   │   ├── ProductList.ets    # 商品列表
│           │   │   ├── ProductDetail.ets  # 商品详情
│           │   │   ├── Cart.ets           # 购物车
│           │   │   └── Profile.ets        # 个人中心
│           │   ├── models/        # 数据模型
│           │   │   └── Models.ets         # 商品、购物车、用户模型
│           │   └── utils/         # 工具类
│           │       └── DataService.ets    # 数据服务
│           ├── resources/         # 资源文件
│           │   └── base/
│           │       ├── element/   # 元素资源（字符串、颜色等）
│           │       ├── media/     # 媒体资源（图片、音频等）
│           │       └── profile/   # 配置文件
│           └── module.json5       # 模块配置
├── build-profile.json5            # 构建配置
├── hvigorfile.ts                  # 构建脚本
└── package.json                   # 依赖配置

```

## 开发环境

### 必需工具

- **DevEco Studio**: 鸿蒙应用开发 IDE（版本 4.0 或更高）
- **HarmonyOS SDK**: API 9 或更高版本
- **Node.js**: 用于包管理

### 环境配置

1. 下载并安装 [DevEco Studio](https://developer.harmonyos.com/cn/develop/deveco-studio)
2. 配置 HarmonyOS SDK
3. 安装 Node.js（建议 v14 或更高版本）

## 快速开始

### 1. 克隆项目

```bash
git clone https://github.com/XingDong-JF/HMShop.git
cd HMShop
```

### 2. 使用 DevEco Studio 打开

1. 打开 DevEco Studio
2. 选择 "Open" 打开项目目录
3. 等待项目索引完成

### 3. 运行应用

#### 在模拟器上运行

1. 在 DevEco Studio 中配置 HarmonyOS 模拟器
2. 点击 Run 按钮运行应用

#### 在真机上运行

1. 连接 HarmonyOS 设备
2. 启用开发者模式和 USB 调试
3. 在 DevEco Studio 中选择设备
4. 点击 Run 按钮运行应用

## 主要页面说明

### 首页 (Index.ets)

- 展示轮播图广告
- 商品分类快捷入口
- 推荐商品网格展示
- 底部导航栏（首页、分类、购物车、我的）

### 商品列表 (ProductList.ets)

- 按分类展示商品
- 商品网格布局
- 显示商品名称、价格、库存信息

### 商品详情 (ProductDetail.ets)

- 展示商品完整信息
- 购买数量选择
- 加入购物车功能
- 立即购买功能

### 购物车 (Cart.ets)

- 展示购物车商品列表
- 修改商品数量
- 删除商品
- 计算总价
- 去结算功能

### 个人中心 (Profile.ets)

- 用户信息展示
- 订单管理入口
- 功能菜单（地址管理、优惠券、客服、设置）

## 数据模型

### Product（商品）

```typescript
{
  id: number;          // 商品ID
  name: string;        // 商品名称
  description: string; // 商品描述
  price: number;       // 商品价格
  imageUrl: string;    // 商品图片URL
  category: string;    // 商品分类
  stock: number;       // 库存数量
}
```

### CartItem（购物车商品）

```typescript
{
  product: Product;    // 商品信息
  quantity: number;    // 购买数量
}
```

## 后续开发计划

- [ ] 用户登录/注册功能
- [ ] 订单管理系统
- [ ] 支付功能集成
- [ ] 商品搜索功能
- [ ] 商品评价系统
- [ ] 收藏功能
- [ ] 地址管理
- [ ] 优惠券系统
- [ ] 后端 API 集成
- [ ] 数据持久化（数据库）

## 技术栈

- **开发语言**: ArkTS (TypeScript-based)
- **UI 框架**: ArkUI (鸿蒙声明式 UI)
- **路由**: @ohos.router
- **状态管理**: @State 装饰器
- **开发工具**: DevEco Studio

## 贡献指南

欢迎贡献代码、提出问题或建议！

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 许可证

本项目采用 ISC 许可证。

## 联系方式

如有问题或建议，请提交 Issue。

---

**注意**: 这是一个示例项目，用于学习和演示鸿蒙应用开发。实际生产环境中需要添加更多的错误处理、安全性检查和性能优化。
