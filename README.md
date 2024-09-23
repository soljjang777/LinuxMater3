# 📁 daily_folder_builder

## 📃 개요
 이 프로젝트는 업무에서 매일 수동으로 폴더와 하위 폴더를 생성해야 하는 불편함을 해결하기 위해 만들어졌습니다.<br/>
Bash 스크립트와 cron을 활용하여 자동으로 오늘 날짜를 기준으로 폴더를 생성하고, 필요한 하위 폴더를 구성함으로써 시간을 절약하고 효율성을 높이고자 했습니다. 이 시스템은 반복적인 작업을 자동화하여, 사용자가 더 중요한 업무에 집중할 수 있도록 도와줍니다.
<br/><br/>

## ⚙ 환경설정
**운영체제** : Ubuntu 22.04.5 LTS <br/>
**커널 버전** : 5.15.0-122-generic
<br/><br/>

## 🔧 실행 방법
**1. cron 설정하기**
``` bash
crontab -e # cron 설정 명령어
crontab -l # cron 설정 확인 명령어
```
<br/>

**2. 아래 코드 복사 붙어 넣기**
   - ```0 8 * * *``` : 매일 오전 8시에 create_folders.sh 실행
   - ```/tmp/cron_output.log``` : cron 작업의 표준 출력(standard output, stdout)이 이 파일에 기록됨. 즉, 스크립트 실행 중에 발생한 정상적인 메시지나 결과가 이 파일에 저장됨
   - ```2>&1``` : 표준 오류(standard error, stderr)를 표준 출력으로 리다이렉트함. 즉, 스크립트 실행 중에 발생한 오류 메시지도 같은 파일(/tmp/cron_output.log)에 저장됨.
      - 2는 stderr의 파일 디스크립터 번호.
      - 1은 stdout의 파일 디스크립터 번호.
      - '>'는 리다이렉션 연산자.
```bash
0 8 * * * /bin/bash /home/username/shellScript/create_folders.sh >> /tmp/cron_output.log 2>&1
```
<br/><br/>

## 📍 테스트
### 로그 확인
```bash
username@servername:~$ cat /tmp/cron_output.log 
폴더 '2024-09-23'와 그 하위 폴더 class1, class2, class3, class4, class5가 생성되었습니다.
```
<br/>

### 폴더 생성 확인
```bash
username@servername:~/shellScript$ tree
.
├── 2024-09-23
│   ├── class1
│   ├── class2
│   ├── class3
│   ├── class4
│   └── class5
└── create_folders.sh
```
