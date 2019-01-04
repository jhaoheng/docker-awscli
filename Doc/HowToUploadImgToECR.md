1. 設定 aws ecr
	1. 新增 `docker run --rm -i -v $(pwd)/awsSet:/root/.aws aws:latest aws ecr create-repository --repository-name {image-name}`
	2. 取得 repositoryUri
2. 建立 image, 並且 tag = `{repositoryUri}/{image-name}`
3. docker login with AWS Registry
	- 方法一 : 
		- `docker run --rm -i -v $(pwd)/awsSet:/root/.aws aws:latest aws ecr get-login --no-include-email --region us-east-1`
		- 返回值是 docker login 的指令, 直接使用
	- 方法二 : 
		- `$(docker run --rm -i -v $(pwd)/awsSet:/root/.aws aws:latest aws ecr get-login --no-include-email --region us-east-1)`
4. 推送
	- `docker push {repositoryUri}/{image-name}:latest`