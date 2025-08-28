import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_morning_ui/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// SliverAppBar : CustomScrollView에서 AppBar 사용하고 싶을 때
// SliverToBoxAdapter : 일반위젯을 CustomScrollView에서 사용하고 싶을 때
// SliverList : ListView를 CustomScrollView에서 사용하고 싶을 때
// SliverPersistentHeader : 항상 표시되는 Sliver
class Home0826 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ListView, SingleChildScrollView 는 전체가 하나의 영역으로 스크롤이 되었음
    // CustomScrollView 는 그 영역을 세세하게 조절할 수 있는 위젯
    // => 세세하게 조정하는 영역을 Sliver (스크롤 영역의 조각)
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: CustomScrollView(
        // ListView 의 children 에 해당하는 속성!
        // Widget 이 들어가지 않고
        // 스크롤 영역의 조각 객체 (Sliver) 가 들어감
        slivers: [
          // SliverAppBar(
          //   // 최소 높이가 되었을때 더이상 스크롤되지 않고 고정할지 여부
          //   pinned: true,
          //   title: Text('슬리버 앱바'),
          //   // flexibleSpace 의 최대 높이
          //   expandedHeight: 300,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text('플렉시블 스페이스'),
          //     background: Opacity(
          //       opacity: .5,
          //       child: Image.network(
          //         'https://picsum.photos/200/300',
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),
          // 스크롤 영역을 조금 더 자유롭게 구현!
          SliverPersistentHeader(
            // minExtent 밑으로 줄어들지 않음!
            pinned: true,
            // pinned false 로 주고 많이 사용
            // floating true 로 주게되면 현재 스크롤의 위치가
            // 최상단이 아니더라도 스크롤 아래로 이동하면 나타남
            // floating: true,
            delegate: MySliver(),
            //
          ),
          // 위젯과 Sliver 사이의 다리 역할
          // CustomScrollView 내에서 일반 위젯 사용하고 싶을 때 사용!
          SliverToBoxAdapter(
            child: Padding(
              // copyWith : 객체를 복사하는 함수
              // 파라미터에 null을 넘겨주면 기존값, 값을 넘겨주면 해당값이 적용되어
              // 새로운 객체 생성해서 반환
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ).copyWith(bottom: 20),
              child: Text(
                "어댑터",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          // 들어가는 속성 및 객체 이름만 다르고
          // 위젯을 반환하는 함수는 ListView.builder 의 itemBuilder 속성에 들어가는
          // 함수와 동일!
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // 원이랑 선은 노란색
                // 글자는 검은색
                // 글자 : OOOOOOOOOOOOO
                // 거리 글자 : 00.0 km
                // 왼쪽 숫자 : 1~10
                return Container(
                  width: double.infinity,
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          //
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 4,
                              height: double.infinity,
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: 20),
                      Expanded(
                        child: DefaultTextStyle(
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Coffee Shop",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Text('2.5km'),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text('서울특별시 서초구 반포동'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              // ListView.builder 의 itemCount 속성과 동일!
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class MySliver extends SliverPersistentHeaderDelegate {
  GoogleMapController? mapController;
  // 그릴 위젯 반환
  // CustomScrollView 가 스크롤 될 때
  // MySliver 의 높이가 변경될 때 호출
  // shrinkOffset => 현재 MySliver 의 위치
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    print("MySliver shrinkOffset : $shrinkOffset");
    return Stack(
      children: [
        Container(
          color: Colors.green,
          child: Center(
            child: GoogleMap(
              // 제스처 우선 순위를 가져오기 위해 설정(현재는 커스텀스크롤뷰가 우선순위가 더 높아 위아래 작동이 잘 안됨)
              gestureRecognizers: {
                // Factory : 객체를 생성하는 함수를 가지고 있는 클래스
                // 필요할 때마다 함수 실행해서 객체를 생성
                Factory(() => EagerGestureRecognizer()),
              },
              initialCameraPosition: CameraPosition(
                // 지도 제일 처음 보이는 위도, 경도
                target: LatLng(35.1681608, 129.0573853),
                zoom: 15, // 배율
              ),
              // 지도에 출력될 마커
              markers: {
                Marker(
                  zIndexInt: 2, // 마커의 보여지는 우선 순위 결정하는 속성, 숫자가 높을수록 위에 보이게 됨
                  markerId: MarkerId(
                    '1',
                  ), // 지도에서 중복되면 안되는 값, 지도 내에서 마커를 특정하기 위해서 사용
                  position: LatLng(35.17510185908504, 128.94967909902334),
                  onTap: () {
                    print('마커 터치됨');
                  },
                  icon: markerIcon!,
                ),
                // Marker(
                //   zIndexInt: 1,
                //   markerId: MarkerId(
                //     '2',
                //   ), // 지도에서 중복되면 안되는 값, 지도 내에서 마커를 특정하기 위해서 사용
                //   position: LatLng(35.17550185908504, 128.94967909902334),
                // ),
              },
              // 구글 기본 현재위치 아이콘 보여지는 지 여부
              // 보통은 false 처리하고 Stack 위젯으로 커스텀 버튼 위젯 겹쳐서 구현함
              // 그리고 버튼 위젯에서 GoogleMapController 이용해서 지도 위치 이동함
              myLocationButtonEnabled: false,
              // 이동한 지도의 가운데에 해당하는 위도, 경도를 가지고 있는 객체
              onCameraMove: (position) {
                print(position);
              },
              // 위치를 리스트 안에 넣어주면 선을 만들어 줌
              polylines: {
                Polyline(
                  polylineId: PolylineId('1'),
                  color: Colors.amber,
                  width: 10,
                  points: [
                    LatLng(35.17510185908504, 128.94967909902334),
                    LatLng(35.20510185908504, 128.94967909902334),
                  ],
                ),
              },
              // 구글맵이 초기화되고 나서 실행되는 함수
              onMapCreated: (controller) async {
                await Future.delayed(Duration(seconds: 3));
                controller.animateCamera(
                  CameraUpdate.newLatLng(
                    LatLng(35.17510185908504, 128.94967909902334),
                  ),
                );
                // 변수에 담아뒀다가 사용함
                // 지도가 초기화되었을 때 전달해주기 떄문에 나중에 지도를 제어하기 위해서 변수에 담아 사용
                mapController = controller;
              },
            ),
          ),
          //
        ),
        //
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
          ),
        ),
      ],
    );
  }

  // 최대 높이
  @override
  double get maxExtent => 600;

  // 최소 높이
  @override
  double get minExtent => 300;

  // MySliver 의 속성이 변경되었을 때 다시 그릴지 여부
  // CustomPainter 사용할 때 사용했던 그 메서드!
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
