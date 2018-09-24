# HIE-Docker
Repository to contain docker configuration for all HIE Components

## Prerequisite
* Docker

## How to use
As of now this repo creates a docker-cluster of HIE with following configuration
* 2 nodes of cassandra
* Mysql Container
* Identity server Container
* Terminology Server Container
* Health Id Server Container
* MCI Server Container

By default this brings up a fresh terminology server. If there is tr-dump available which we want to start with, we can put the dump file at `mysql/tr-dump.sql`. This will bring up a TR, initialized with the given dump file. We would need to change the openmrs global_property `webservices.rest.uriPrefix` to `http://192.168.33.1:9080/openmrs` after startup.


```
git clone git@github.com:SharedHealth/HIE-Docker.git
cd HIE-Docker
./build-all-services.sh
./create-shr-cluster.sh
```

We need to do below setup before we can start using these.


#### Generate Health-IDs
Login as shr-system-admin to identity server to get a access-token
```
curl http://localhost:8084/signin -H "X-Auth-Token:local-shr-system-admin_auth_token" -H "client_id:18700" --form "email=local-shr-system-admin@test.com" --form "password=password"
```
Use the access token to generate Health-IDs for MCI. Replace the `<ACCESS-TOKEN-FROM-ABOVE-STEP>` in below request with token from above step. 
```
curl -X POST 'http://localhost:8086/healthIds/generateBlock?start=9800000100&totalHIDs=100' -H 'From: local-shr-system-admin@test.com' -H 'X-Auth-Token: <ACCESS-TOKEN-FROM-ABOVE-STEP>' -H 'client_id: 18700'
```

#### Insert MCI Locations:-
We need to have locations setup to create patients in MCI. A sample locations cql file is available `cassandra/mci_locations.cql`.

```
docker cp cassandra/mci_locations.cql cassandra-seed:/tmp
docker exec cassandra-seed /bin/bash -c "cqlsh -k mci -f /tmp/mci_locations.cql"
```
Above will take some time if we are using an actual locations dump which has more than 50,000 entries.

#### Create a patient:-
Login to IDP as `facility-admin` to get a token.
```
curl http://localhost:8084/signin -H "X-Auth-Token:local-facility-admin_auth_token" -H "client_id:18701" --form "email=local-facility-admin@test.com" --form "password=password"
```
Use the access token to create patient in MCI. Replace the `<ACCESS-TOKEN-FROM-ABOVE-STEP>` in below request with token from above step. 
```
curl -X POST \
  http://localhost:8081/api/v1/patients \
  -H 'Content-Type: application/json' \
  -H 'From: local-facility-admin@test.com' \
  -H 'X-Auth-Token: <ACCESS-TOKEN-FROM-ABOVE-STEP>' \
  -H 'client_id: 18701' \
  -d '{
    "given_name": "Pavan",
    "sur_name": "Das",
    "nid": "1666321725072",
    "date_of_birth": "1992-07-14",
    "gender": "M",
    "present_address": {
        "address_line": "Street 1, Baridhara village",
        "division_id": "30",
        "district_id": "26",
        "upazila_id": "02"
    },
    "confidential": "No"
}'
```
