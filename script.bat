echo "Criando as imagens..."

docker build -t eduardonoda/projeto-backend:1.0 backend/.
docker build -t eduardonoda/projeto-database:1.0 database/.

echo "Realizando push das imagens..."

docker push eduardonoda/projeto-backend:1.0
docker push eduardonoda/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments"

kubectl apply -f ./deployment.yml
