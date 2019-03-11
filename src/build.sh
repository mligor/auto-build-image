# build stage script for Auto-DevOps

if ! docker info &>/dev/null; then
  if [ -z "$DOCKER_HOST" -a "$KUBERNETES_PORT" ]; then
    export DOCKER_HOST='tcp://localhost:2375'
  fi
fi

if [[ -n "$CI_REGISTRY_USER" ]]; then
  echo "Logging to GitLab Container Registry with CI credentials..."
  docker login -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD" "$CI_REGISTRY"
fi

if [[ -f Dockerfile ]]; then
  echo "Building Dockerfile-based application..."
else
  echo "Building Heroku-based application using gliderlabs/herokuish docker image..."
  cp /build/Dockerfile Dockerfile
fi

docker build \
  --build-arg BUILDPACK_URL="${BUILDPACK_URL:-$buildpack_url}" \
  --build-arg HTTP_PROXY="${HTTP_PROXY:-$http_proxy}" \
  --build-arg HTTPS_PROXY="${HTTPS_PROXY:-$https_proxy}" \
  --build-arg FTP_PROXY="${FTP_PROXY:-$ftp_proxy}" \
  --build-arg NO_PROXY="${NO_PROXY:-$no_proxy}" \
  --tag "$CI_APPLICATION_REPOSITORY:$CI_APPLICATION_TAG" .

docker push "$CI_APPLICATION_REPOSITORY:$CI_APPLICATION_TAG"
