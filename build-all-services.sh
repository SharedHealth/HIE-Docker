#!/usr/bin/env bash
set -e

echo "Build Freeshr Server"
cd ../FreeSHR/
./gradlew clean dist -x test
cd ../docker-env

echo "Build MCI Server"
cd ../MCI-Service/
./gradlew clean dist -x test
cd ../docker-env

#todo MCI-Admin
#echo "Build MCI Server"
#cd ../MCI-Service/
#./gradlew clean dist -x test
#cd ../docker-env

echo "Build MCI-Backgroud-Jobs Server"
cd ../MCI-Backgroud-Jobs/
./gradlew clean dist -x test
cd ../docker-env

echo "Build MCI-LR Server"
cd ../MCI-LR/
./gradlew clean dist -x test
cd ../docker-env

echo "Build MCI-Registry Server"
cd ../MCI-Registry/
./gradlew clean dist -x test
cd ../docker-env

echo "Build HealthId-Service Server"
cd ../HealthId-Service/
./gradlew clean dist -x test
cd ../docker-env

echo "Build Identity-Server Server"
cd ../Identity-Server/
./gradlew clean dist -x test
cd ../docker-env

echo "Build PatientJournal Server"
cd ../PatientJournal/
./gradlew clean dist -x test
cd ../docker-env

echo "Build Datasense Server"
cd ../SHR-Datasense/
./gradlew clean dist -x test
cd ../docker-env

echo "Build Terminology-Server Server"
cd ../Terminology-Server/
./gradlew clean dist -x test
cd ../docker-env

echo "Build freeshr-update Server"
cd ../freeshr-update/
./gradlew clean dist -x test
cd ../docker-env


