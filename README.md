# bitbucket-runner-resource-caps

Bitbucket docker runners set CPU and memory limits on the conatiners running steps for self-hosted runners. This is annoying when we want to run high resource tasks on our runners. This is a simple solution to that problem modeled after [this](https://github.com/tramseyer/bitbucket-pipelines-runner-unlimited)

## Install

```bash
git clone https://github.com/arcservejonah/bitbucket-runner-resource-caps.git
cd bitbucket-runner-resource-caps
sudo ./setup.sh
```

## Helpful Commands

- Print table of current containers and their quotas/limits
    ```bash
    echo; echo; docker ps -aq | xargs -I {} docker inspect --format="{{.Id}} {{.Name}} {{.HostConfig.CpuQuota}} {{.HostConfig.Memory}} {{.HostConfig.MemorySwap}}" {} | awk 'BEGIN {printf "%-15s %-95s %-12s %-15s %-15s\n", "ID", "NAME", "CPU_QUOTA", "MEMORY", "SWAP"; printf "%-15s %-95s %-12s %-15s %-15s\n", "---------------", "-----------------------------------------------------------------------------------------------", "------------", "---------------", "---------------"} {printf "%-15s %-95s %-12s %-15s %-15s\n", substr($1,1,12), $2, $3, $4, $5}'
    ```
- Monitor service
    ```bash
    systemctl status --no-pager runner-resource-caps.service
    ```
