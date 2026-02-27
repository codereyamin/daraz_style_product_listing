# 🛍️ Daraz Style Product Listing (Flutter + Riverpod)

A Flutter implementation of a Daraz-style product listing screen with:

- Collapsible banner header
- Sticky TabBar
- Horizontal tab swipe
- Vertical scrolling product lists
- Grid & List layout
- Riverpod state management
- Skeleton loading effect

---

# 📁 Project Structure

```
lib/
├── services/
│   ├── api/
│   ├── repositories/
│   └── storage/
├── constants/
├── models/
├── routes/
├── widgets/
├── utils/
├── screens/
│   └── home_screen/
│       ├── providers/
│       ├── screens/
│       └── widgets/
```

---

# 🧠 Architecture Overview

This project follows a clean layered structure:

- **UI Layer** → `screens/`, `widgets/`
- **State Management** → `providers/` (Riverpod StateNotifier)
- **Repository Layer** → `services/repositories/`
- **Model Layer** → `models/`
- **Utilities & Constants** → `utils/`, `constants/`

---

# 🔄 Scrolling & Swipe Implementation (Mandatory Explanation)

## 1️⃣ How Horizontal Swipe Was Implemented

Horizontal tab swipe is implemented using:

```dart
TabController
TabBar
TabBarView
```

Inside `HomeScreen`:

```dart
NestedScrollView(
  body: TabBarView(
    controller: _tabController,
    children: [
      HomeScreenAllScreen(),
      HomeScreenGridView(),
      ...
    ],
  ),
)
```

- `TabBarView` handles horizontal swipe automatically.
- `TabController` manages active tab state.
- `TickerProviderStateMixin` is used for animation support.

So when the user swipes left/right → `TabBarView` changes tabs.

---

## 2️⃣ Who Owns the Vertical Scroll and Why

### Vertical scroll is owned by:

```
NestedScrollView
```

Why?

Because:

- We need a collapsible header (`SliverAppBar`)
- We need a sticky `TabBar`
- Each tab has its own scrollable list/grid

Structure:

```
NestedScrollView
 ├── SliverAppBar (collapsible banner)
 ├── SliverPersistentHeader (sticky TabBar)
 └── TabBarView
      ├── ListView (vertical scroll)
      ├── GridView (vertical scroll)
```

### Important:

Each tab contains its own `ListView` or `GridView`.

Flutter automatically links the inner scroll views with `NestedScrollView`
so header collapses smoothly before inner scroll continues.

This prevents scroll conflicts.

---

## 3️⃣ Trade-offs & Limitations

### ✅ Advantages

- Clean separation of header & body
- Smooth collapsing effect
- Independent scroll per tab
- Riverpod keeps state reactive
- Easy to scale with more tabs

---

### ⚠️ Limitations / Trade-offs

1. `NestedScrollView` can be complex when:
   - Using pagination
   - Using RefreshIndicator
   - Using very large lists

2. GridView inside TabBarView may:
   - Rebuild frequently
   - Lose scroll position if not managed properly

3. Multiple scrollables increase memory usage slightly.

4. Sliver-based layouts require careful scroll physics handling
   if custom behavior is needed.

---

# 📦 State Management

Using:

```
flutter_riverpod (StateNotifier)
```

### Flow:

```
HomeScreenProvider
      ↓
ProductRepository
      ↓
API / Mock Data
```

Provider State:

```dart
class HomeScreenProviderState {
  final bool isLoading;
  final bool hasError;
  final List<Product> listOfProduct;
}
```

On load:

```dart
onDataLoad()
```

On refresh:

```dart
onDataRefresh()
```

---

# 🧱 UI Components Used

- `NestedScrollView`
- `SliverAppBar`
- `SliverPersistentHeader`
- `TabBar`
- `TabBarView`
- `ListView.builder`
- `GridView.builder`
- `Pull-to-refresh`
- `Skeletonizer` (loading state)

---

# 🚀 How To Run

```
flutter pub get
flutter run
```

---

# 🎯 Key Learning Points

- How to build Daraz-style sticky header UI
- How to combine Slivers with Tabs
- How NestedScrollView coordinates scroll
- How to use Riverpod StateNotifier properly
- Handling loading & error state cleanly

---

# 📌 If Extending This Project

can add:

- Pagination
- Search feature
- Category filtering
- Caching layer
- API error handling improvements
- Scroll position preservation per tab




