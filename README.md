# Flutter Train Reservation App

이 프로젝트는 **기차 예약 앱**으로, 사용자가 출발역과 도착역을 선택하고 좌석을 예약할 수 있는 기능을 제공합니다.

## 주요 기능

- 출발역과 도착역 선택
- 좌석 선택 및 상태 표시 (선택 시 색상 변경)
- 예약 확인 팝업 표시 (선택된 좌석 번호와 출발/도착역 정보 포함)
- **Flutter의 StatefulWidget** 및 **ListView.builder**를 사용하여 동적 UI 구현

---

## 폴더 구조

```plaintext
lib/
├── home/
│   ├── widget/
│   │   ├── seat_button.dart        # 메인 페이지의 좌석 선택 버튼
│   │   ├── station_select.dart     # 출발역 및 도착역 선택 위젯
│   │   └── homa_page.dart          # 홈 화면 (기차 예매 메인 페이지)
├── seat/
│   ├── widget/
│   │   ├── select_view.dart        # 좌석 선택 UI
│   │   ├── travel_view.dart        # 출발역과 도착역 정보를 표시하는 위젯
│   └── seat_page.dart              # 좌석 선택 페이지
├── station/
│   ├── station_list_page.dart      # 역 리스트 페이지
└── main.dart                       # 앱의 진입점
```

---

## 주요 파일 설명

### 1. `main.dart`

- **역할**: 앱의 진입점입니다. 홈 화면(`HomaPage`)으로 이동하도록 설정합니다.

#### 주요 코드

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '기차 예매 앱',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomaPage(), // 메인 페이지
    );
  }
}
```

---

### 2. `HomaPage` (`homa_page.dart`)

- **역할**: 기차 예매 앱의 메인 페이지로, 출발역 및 도착역을 선택하고 좌석 선택 페이지로 이동할 수 있습니다.

#### 주요 코드

```dart
StationSelect(
  departureStation: selectedDepartureStation,
  arrivalStation: selectedArrivalStation,
  onSelectDeparture: () async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StationListPage(title: '출발역'),
      ),
    );
    if (result != null) {
      setState(() {
        selectedDepartureStation = result;
        selectedArrivalStation = null; // 출발역 변경 시 도착역 초기화
      });
    }
  },
  onSelectArrival: () async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StationListPage(
          title: '도착역',
          excludedStation: selectedDepartureStation, // 출발역 제외
        ),
      ),
    );
    if (result != null) {
      setState(() {
        selectedArrivalStation = result;
      });
    }
  },
);
```

---

### 3. `SeatPage` (`seat_page.dart`)

- **역할**: 좌석 선택 페이지로, 사용자가 좌석을 선택하고 예약 정보를 확인할 수 있습니다.

#### 주요 코드

```dart
Expanded(
  child: ListView(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSeatColumn('A'),
          buildSeatColumn('B'),
          buildSeatColumn(' '),
          buildSeatColumn('C'),
          buildSeatColumn('D'),
        ],
      ),
    ],
  ),
),
```

---

### 4. `travelView` (`travel_view.dart`)

- **역할**: 출발역과 도착역 정보를 표시하는 위젯입니다.
- **구조**: `Row` 위젯을 사용해 가로로 배치합니다.

#### 주요 코드

```dart
class travelView extends StatelessWidget {
  final String departureStation;
  final String arrivalStation;

  const travelView({
    Key? key,
    required this.departureStation,
    required this.arrivalStation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(departureStation),
        Icon(Icons.arrow_forward),
        Text(arrivalStation),
      ],
    );
  }
}
```

---

### 5. `StationListPage` (`station_list_page.dart`)

- **역할**: 사용자가 선택할 수 있는 역 리스트를 표시합니다.
- **구현**: `ListView.builder`를 사용해 역 목록을 동적으로 생성합니다.

---

### 6. 예약 버튼 (`reserve_button.dart`)

- **역할**: "예매 하기" 버튼을 클릭하면 예약 정보를 팝업으로 표시합니다.

#### 주요 코드

```dart
Widget reserveButton() {
  return ElevatedButton(
    onPressed: () {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('예약하시겠습니까?'),
            content: Text(
              '출발역: ${widget.departureStation}
도착역: ${widget.arrivalStation}
선택된 좌석: ${selectedSeats.join(', ')}',
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('취소'),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                  // 예약 확정 처리
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    },
    child: Text('예매 하기'),
  );
}
```

---

## 주요 기능

1. **출발역 및 도착역 선택**
   - 출발역과 도착역을 선택하며, 출발역 선택 시 도착역은 동일하지 않도록 필터링.

2. **좌석 선택**
   - 좌석을 클릭하여 선택하면 색상이 보라색으로 변경됨.
   - 선택된 좌석 번호는 리스트로 저장됨.

3. **예약 팝업**
   - "예매 하기" 버튼 클릭 시 예약 정보 팝업 표시:
     - 출발역
     - 도착역
     - 선택된 좌석 번호

---

## 기술 스택

- **Flutter**
- **Dart**
- **StatefulWidget** 및 **StatelessWidget**
- **ListView.builder**: 동적 리스트 생성

---