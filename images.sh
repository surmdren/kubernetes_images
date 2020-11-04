images=(k8s.gcr.io/kube-apiserver:v1.19.3
        k8s.gcr.io/kube-controller-manager:v1.19.3
        k8s.gcr.io/kube-scheduler:v1.19.3
        k8s.gcr.io/kube-proxy:v1.19.3
        k8s.gcr.io/pause:3.2
        k8s.gcr.io/etcd:3.4.13-0
        k8s.gcr.io/coredns:1.7.0)
for imageName in ${images[@]};do
    docker pull $imageName
done

for imageName in ${images[@]};do
    image=$(echo ${imageName} | awk -F '/' '{print $2}')
    docker tag ${imageName} surmdren/$image
    docker push surmdren/$image
done

