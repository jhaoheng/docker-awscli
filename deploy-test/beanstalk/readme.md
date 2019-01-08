# 注意事項
- 注意 private 的 auth
- 注意 ecs 取得 s3 的檔案權限問題
- 注意 Dockerrun.aws.json 中的 tag, 容易出錯, 就要重新部署
- 建議先用 image:nginx 進行測試, access 到 ec2 中, 查看是否正確
    - ec2 上的部署 log 在 `/var/log/eb-commandprocessor.log`

# 使用步驟
1. 更新 script 中的變數
2. 依序執行 script 1~6