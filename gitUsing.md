## 깃 특정 태그로 다운로드

---

- git checkout tags/v14.0.0
- git clone -b <tag> <repository> -> git clone -b v14.0.0 https://github.com/miniplugin/human.git
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
git commit -m 'v14.0.0'
git tag -d v14.0.0
git tag v14.0.0
git push origin :v14.0.0
git push origin v14.0.0
```
