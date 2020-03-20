set -e
docker run -it -v $(pwd):/home/blockchain-automation-framework/ hyperledgerlabs/baf-build /bin/bash -c "cd blockchain-automation-framework && sh ./build/reset-kube.sh"
minikube delete
echo "sleeping 10 seconds"
sleep 10

minikube start

cd ./build && sh copy-things.sh && cd ..

docker run -it -v $(pwd):/home/blockchain-automation-framework/ hyperledgerlabs/baf-build

