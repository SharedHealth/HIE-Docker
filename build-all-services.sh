#!/usr/bin/env bash
set -e

echo "Build Freeshr Server"
cd ../FreeSHR/
./gradlew clean dist -x test
cd ../HIE-Docker

echo "Build MCI Server"
cd ../MCI-Service/
./gradlew clean dist -x test
cd ../HIE-Docker

echo "Build HealthId-Service Server"
cd ../HealthId-Service/
./gradlew clean dist -x test
cd ../HIE-Docker

echo "Build Identity-Server Server"
cd ../Identity-Server/
./gradlew clean dist -x test
cd ../HIE-Docker

echo "Build Terminology-Server Server"
cd ../Terminology-Server/
./gradlew clean dist -x test
cd ../HIE-Docker

echo "Build SHR-Datasense Server"
cd ../SHR-Datasense/
./gradlew clean dist -x test
cd ../HIE-Docker

