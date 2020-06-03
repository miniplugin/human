## 깃 특정 태그로 다운로드

---

- git checkout master
- git checkout tags/v12.0.0

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
git commit -m 'v12.0.0'
git tag -d v12.0.0
git tag v12.0.0
git push origin :v12.0.0
git push origin v12.0.0
```
