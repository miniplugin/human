## 깃 특정 태그로 다운로드

---

- git checkout master
- git checkout tags/v1.0.0
- git clone -b <tag> <repository>

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
git commit -m 'v1.0.0'
git tag -d v1.0.0
git tag v2.0.0
git push origin :v1.0.0
git push origin v1.0.0
```
