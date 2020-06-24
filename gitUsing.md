## 깃 특정 태그로 다운로드

---

- git checkout master
- git checkout tags/v16.0.0

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
git commit -m 'v16.0.0'
git tag -d v16.0.0
git tag v16.0.0
git push origin :v16.0.0
git push origin v16.0.0
```
