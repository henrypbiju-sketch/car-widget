FROM gitpod/workspace-full:latest

# Install Java 17 (required for Android Gradle Plugin)
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-17-jdk && \
    sudo update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java && \
    sudo update-alternatives --set javac /usr/lib/jvm/java-17-openjdk-amd64/bin/javac
