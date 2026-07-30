#!/usr/bin/env bash
# 코드 수정 후 재배포: ./deploy.sh ["커밋 메시지"]
set -euo pipefail

cd "$(dirname "$0")"

MSG="${1:-deploy: update $(date '+%Y-%m-%d %H:%M')}"

if [ -z "$(git status --porcelain)" ]; then
  echo "변경사항이 없습니다. 배포를 건너뜁니다."
  exit 0
fi

git add -A
git commit -m "$MSG"
git push origin main

echo
echo "배포 완료 → https://ssangyongttt.github.io/ar-traveling/"
echo "(GitHub Pages 반영까지 30초~1분 걸립니다)"
