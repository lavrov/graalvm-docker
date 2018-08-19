image_name = lavrov/graalvm
version = 1.0.0-rc5

default: build

build:
	docker build . --build-arg GRAAL_VERSION=${version} --tag ${image_name}:${version}

push: build
	docker push ${image_name}:${version}

