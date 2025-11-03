# 포켓몬 카드 랜덤박스 v8.1 — 배포 & 실제 연결 가이드

## 파일
- `docs/index.html` — GitHub Pages용 (휴대폰 OTP→ID/PW, 인벤토리/크레딧 저장, 결제링크, 배송비 결제 후 주문서 자동메일)
- `docs/local-test.html` — 로컬 모의(OTP/결제/메일 모의)
- `docs/schema.sql` — Supabase 테이블/RLS 정책

## GitHub Pages
1. 새 저장소 만들기 → `docs/` 폴더에 파일 업로드
2. Settings → Pages: Branch=`main`, Folder=`/docs`
3. 배포 URL 열기

## Supabase
1. Authentication → Providers → **Phone** 활성화(발신 세팅 필요)
2. SQL Editor에서 `schema.sql` 실행
3. Project Settings → API의 **URL**/**anon key**를 `index.html`에 입력

## EmailJS
1. 서비스/템플릿/퍼블릭키 생성, 변수: `subject`, `body`, `to_email`
2. 수신자는 `ddogy503@gmail.com`

## 결제 링크 (Toss 권장)
- 링크 3개: 600원, 5,900원, 3,000원(배송비)
- 배송비 링크의 성공 리다이렉트 URL = 사이트주소 + `?ship=ok`
- 상단 CONFIG에 각 링크를 넣기

## 희귀 목록 정렬
- v8.1에서 보관함의 **희귀/일반** 모두 세로 정렬, 각 행은 `flex`로 우측에 수량 정렬, 줄바꿈 방지

## 체크리스트
- 회원가입(OTP) → ID/PW 로그인
- 600/5900 결제버튼 → 크레딧 증가
- 뽑기 → 확률(C/U/R 65%, RR 20%, AR 5%, RRR 7%, SAR 2.2%, 등급카드 0.8%)
- 10장 이상 → 주문서 작성 → 배송비 결제 링크 → 돌아오면 자동메일 → 주문 확정 시 보관함 0으로 초기화

## 고도화
- 결제 웹훅 검증으로 credit 자동 증가
- 주문서에 주소/우편번호/수령인 입력 추가
