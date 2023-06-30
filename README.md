# RealNumber
OH Coding

## 본 코드는 flutter 코드 중 핵심 코드만 가져왔습니다.

### 모두 불러오려고 해도 프로젝트 파일이 1GB 남짓해서 못가져와요 ㅠㅠ

메인코드는 main.dart 일걸요

대부분은 수제작이지만 transition과 Textanimation 은 Flutter galary에서 참고하였습니다.

이번 개발에서는 최적화에 신경을 써뵜습니다.

알고리즘상 while문을 피할수 없었는데, 귀찮은 const 처리를 통해 사용량을 적절히 분배해주었습니다.

또한 provider 모듈을 사용해 지역변수로만 처리할 수 있었던 Dart언어애서 한 파일 전체, context를 공유하는 곳에서는 전역변수로 처리할 수 있다는 점에서 장점이 있는 모듈입니다.

StateLess Class를 사용하는 예제코드와 달리, StateFul, setState, notifylistner 등을 사용하여 화면이 실시간으로 바뀌는 것을 구현하였습니다.

원래는 문제를 컴퓨터 그래픽으로 만들어서 출제하려고 했는데, 시간이 촉박했던 관계로 종이에 그림응 그려 사진으로 대체하였습니다.

## 감사합니다.
