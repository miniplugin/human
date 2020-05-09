## 깃 특정 태그로 다운로드

---

- git checkout tags/v5.0.0

---

### 기본(마스터) 사용법

```
git add .
git commit -m 'master'
git push origin master
```

### 태그 고정버전 사용법
```
git add .
git commit -m 'v5.0.0'
git tag -d v5.0.0
git tag v5.0.0
git push origin :v5.0.0
git push origin v5.0.0
```

### 깃 에러 처리 bad signature ,  bad signature 0x00000000
```
cd .git
del index
cd ..
git reset
```