#!/bin/bash

# Step 1: Clone the repository (replace <repository_url> with your Git repository URL)
git clone https://github.com/kartikmehta056/kartik_node_app.git


# Variables
DOCKER_REPO="kartikmehta056"
DOCKER_IMAGE_NAME="mynode_project1"
DOCKER_TAG="latest"
DOCKERFILE_PATH="/kartik/kartik_node_app/"
# Remove the existing container image from the repository (if it exists)
if docker pull "$DOCKER_REPO/$DOCKER_IMAGE_NAME:$DOCKER_TAG" &> /dev/null; then
    echo "Removing existing container image from the repository..."
    docker rmi "$DOCKER_REPO/$DOCKER_IMAGE_NAME:$DOCKER_TAG"
fi

# Build the Docker image
echo "Building the Docker image..."
docker build -t "$DOCKER_IMAGE_NAME:$DOCKER_TAG" "$DOCKERFILE_PATH"

# Push the Docker image to the repository
echo "Pushing the Docker image to the repository..."
docker tag "$DOCKER_IMAGE_NAME:$DOCKER_TAG" "$DOCKER_REPO/$DOCKER_IMAGE_NAME:$DOCKER_TAG"
docker push "$DOCKER_REPO/$DOCKER_IMAGE_NAME:$DOCKER_TAG"

docker rm -f $(docker ps -aq)


# Run the Docker container
echo "Running the Docker container..."
docker run -d --name "$DOCKER_IMAGE_NAME" -p 80:80 "$DOCKER_REPO/$DOCKER_IMAGE_NAME:$DOCKER_TAG"

