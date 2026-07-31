# 조이스틱 로드뷰 여행 (Joystick Roadview)

카카오 로드뷰 API 위를 가상 조이스틱 · 키보드(WASD) · 게임패드로 "걸어다니며" 둘러보는 단일 HTML 웹앱입니다.
카카오 JavaScript 키는 코드에 포함되지 않고, 접속 후 첫 화면에서 사용자가 직접 입력해 해당 브라우저 세션에서만 사용됩니다.

## 배포 URL

**https://ssangyongttt.github.io/ar-traveling/**

카카오 개발자센터에 등록할 origin: `https://ssangyongttt.github.io`

## 카카오 개발자센터 설정 체크리스트

접속 전에 아래 3가지를 반드시 완료해야 로드뷰가 정상 동작합니다.

- [ ] **a) JavaScript 키 발급**
  [developers.kakao.com](https://developers.kakao.com) 로그인 → **내 애플리케이션** → 애플리케이션 추가하기 →
  생성된 앱 → **플랫폼 키 > JavaScript 키** 복사

- [ ] **b) JavaScript SDK 도메인 등록**
  **플랫폼 키 > JavaScript 키** → **JavaScript SDK 도메인** 에 아래 origin 입력 후 저장

  ```
  https://ssangyongttt.github.io
  ```

  > ⚠️ **"제품 링크 관리 > 웹 도메인"이 아닙니다.** 그쪽은 카카오톡 공유·메시지의 링크 이동용이라
  > 여기에 등록해도 로드뷰는 동작하지 않습니다. 반드시 **JavaScript SDK 도메인** 에 등록하세요.
  >
  > 경로(`/ar-traveling/`)는 빼고 **origin만** 넣습니다.
  > 이 단계를 건너뛰면 SDK 로드 시 401 에러가 발생합니다.

- [ ] **c) 카카오맵 사용 설정 ON**
  **제품 설정 > 카카오맵** → **사용 설정**을 **ON**으로 변경
  (콘솔 버전에 따라 **앱 설정 > 제품 설정** 하위에 있을 수 있습니다)

## 사용법

1. 배포 URL(https://ssangyongttt.github.io/ar-traveling/) 접속
2. 발급받은 **JavaScript 키** 입력
3. **출발 위도 / 경도** 입력 (기본값: 서울시청 `37.5665`, `126.9780`)
4. **여행 시작** 클릭

### 조작

| 입력 | 동작 |
| --- | --- |
| 조이스틱 위 / `W` / `↑` | 전진 |
| 조이스틱 아래 / `S` / `↓` | 후진 |
| 조이스틱 좌우 / `A` `D` / `←` `→` | 좌우 회전 |
| 화면 드래그 | 시점 둘러보기 |
| 게임패드 연결 | 좌측 스틱으로 동일 조작 (자동 인식) |

좌측 상단 HUD에 현재 방위각·위도·경도가, 우측 상단에 나침반이 표시됩니다.
진행 방향에 로드뷰 데이터가 없으면 "이 방향으로는 로드뷰가 없습니다" 토스트가 뜹니다.

## 재배포

코드 수정 후 한 줄이면 됩니다.

```bash
./deploy.sh                 # 기본 커밋 메시지로 배포
./deploy.sh "조이스틱 감도 조정"   # 커밋 메시지 지정
```

`git add` → `commit` → `push`를 자동으로 수행하며, push 후 GitHub Pages가 재빌드되기까지 보통 30초~1분 걸립니다.

## 로컬에서 테스트하려면

`file://`로 열면 카카오 SDK의 도메인(Referer) 인증이 실패해 반드시 실패합니다. 로컬 서버를 띄우세요.

```bash
python3 -m http.server 8000
# http://localhost:8000 접속
```

이때는 **JavaScript SDK 도메인** 에 `http://localhost:8000`도 추가로 등록해야 합니다.

## 참고: GitHub Pages 수동 설정

이 저장소는 Pages가 이미 활성화되어 있습니다. 혹시 비활성화되었거나 새 저장소에 옮길 경우:

**Settings > Pages** → Source를 **Deploy from a branch** → Branch **main** / 폴더 **/ (root)** 선택 → Save
