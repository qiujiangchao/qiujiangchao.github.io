#!/bin/bash
# 批量将非 web 版 MP4 转为 web 版（H.264 + AAC）
for f in *.mp4; do
  if [[ "$f" != *_web.mp4 ]]; then
    base="${f%.mp4}"
    echo "正在转换: $f -> ${base}_web.mp4"
    ffmpeg -i "$f" -c:v libx264 -crf 23 -preset fast -c:a aac -movflags +faststart "${base}_web.mp4"
  fi
done

