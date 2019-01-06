> https://docs.aws.amazon.com/zh_tw/AmazonECS/latest/developerguide/ECS_GetStarted.html

# IAM 設定

> 必須確認角色的權限, 若無設定, 則 cluster 中 service 在建立 task 時會失敗

1. https://console.aws.amazon.com/iam/home
2. 選擇 role, 並建立 role 
    - 選擇 AWS Service
    - service 選擇 Elastci Container Service
    - case 選擇 EC2 Role for Elastic Container Service
3. 建立完成後, 至該 role 中 Trust relationships -> Edit Trust relationship, 新增

```
{
    "Sid": "",
    "Effect": "Allow",
    "Principal": {
    "Service": "ecs-tasks.amazonaws.com"
    },
    "Action": "sts:AssumeRole"
}
```

4. 新增完畢後, 請 copy `Role ARN` 貼到 demo.json 中的 executionRoleArn 位置

# 建立 cluster
- 查看 : `aws ecs list-clusters`
- 建立 : `aws ecs create-cluster --cluster-name {name}`

# 建立任務定義
> 任務定義參數 : https://docs.aws.amazon.com/zh_tw/AmazonECS/latest/developerguide/task_definition_parameters.html

## 目的
- 和任務中每個容器一起使用的 Docker 影像
- 每個任務或任務中每個容器使用多少 CPU 和記憶體
- 要使用的啟動類型，這決定您任務託管所在的基礎設施
- 您任務中的容器所使用的 Docker 聯網模式
- 用於任務的記錄組態
- 如果容器完成或失敗，任務是否應該繼續執行
- 容器啟動時應執行的命令
- 任務中的容器應使用的任何資料磁碟區
- 任務應該使用的 IAM 角色

## 確定任務內容
參考 demo.json

## 設定任務
> 若用 docker, 要將 demo.json 掛載 volume

- 執行
	- `aws ecs register-task-definition --cli-input-json file:///home/test.json`
- 查看任務
	- `aws ecs list-task-definitions`

# Cluster Service 執行任務
> 必須確認 executionRoleArn 的權限, 若無適當權限,則 cluster 中 service 在建立 task 時會失敗

- `aws ecs create-service --cluster {cluster-name} --service-name {service-name} --task-definition {task-name}:{revision} --desired-count 1 --launch-type "FARGATE" --network-configuration "awsvpcConfiguration={subnets=[subnet-34c09272],securityGroups=[sg-5f8e0e39], assignPublicIp=ENABLED}"`
    - 因 demo.json 設定檔使用 awsvpc, 故這邊要設定 awsvpcConfiguration
        - list subnets
            - `docker run --rm -i -v $(pwd)/awsSet:/root/.aws aws:latest aws ec2 describe-subnets`
        - list securityGroups
            - `docker run --rm -i -v $(pwd)/awsSet:/root/.aws aws:latest aws ec2 describe-security-groups`
    - 若無 assignPublicIp, 則無法 pull image
- 列出服務
	- `docker run --rm -i -v $(pwd)/awsSet:/root/.aws aws:latest aws ecs list-services --cluster {cluster-name}`

# 更新任務版本
```
docker run --rm -i -v $(pwd)/awsSet:/root/.aws aws:latest aws ecs update-service --cluster {cluster-name} --service {service-name} --task-definition {task-name}"
```

# 錯誤
- service nginx failed to launch a task with ... 
	- executionRoleArn 權限錯誤 ... 無法建立 task
- CannotPullContainerError
	- 增加 json 設定 : `assignPublicIp=ENABLED`
