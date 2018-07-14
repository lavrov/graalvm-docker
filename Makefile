image_name = lavrov/graalvm
version = 1.0.0-rc3

default:
	docker build . --build-arg GRAAL_VERSION=${version} --tag ${image_name}:${version}
