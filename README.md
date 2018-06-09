# HIE-Docker
Repository to contain docker configuration for all HIE Components


```
./build-all-services.sh
./create-shr-cluster.sh

curl http://localhost:8084/signin -H "X-Auth-Token:local-shr-system-admin_auth_token" -H "client_id:18700" --form "email=local-shr-system-admin@test.com" --form "password=password"

curl -X POST 'http://localhost:8086/healthIds/generateBlock?start=9800000100&totalHIDs=100' -H 'From: local-shr-system-admin@test.com' -H 'X-Auth-Token: <ACCESS-TOKEN-FROM-ABOVE-STEP>' -H 'client_id: 18700'

docker exec -it cassandra-seed bash
	cqlsh
		USE mci ;
		INSERT INTO locations ("code", "name", "active","parent") VALUES ('30','Dhaka','1','00') IF NOT EXISTS;
		INSERT INTO locations ("code", "name", "active","parent") VALUES ('26','Dhaka','1','30') IF NOT EXISTS;
		INSERT INTO locations ("code", "name", "active","parent") VALUES ('02','Adabor','1','3026') IF NOT EXISTS;
		INSERT INTO locations ("code", "name", "active","parent") VALUES ('20','Dhaka Dakshin City Corp.','1','302602') IF NOT EXISTS;
		INSERT INTO locations ("code", "name", "active","parent") VALUES ('25','Dhaka Uttar City Corp.','1','302602') IF NOT EXISTS;
		INSERT INTO locations ("code", "name", "active","parent") VALUES ('30','Urban Ward No-30 (43)','1','30260225') IF NOT EXISTS;
		INSERT INTO locations ("code", "name", "active","parent") VALUES ('33','Urban Ward No-33 (part) (46)','1','30260225') IF NOT EXISTS;
```


curl http://localhost:8084/signin -H "X-Auth-Token:local-facility-admin_auth_token" -H "client_id:18701" --form "email=local-facility-admin@test.com" --form "password=password"

curl -X POST \
  http://localhost:8081/api/v1/patients \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -H 'From: local-facility-admin@test.com' \
  -H 'Postman-Token: d871f20b-8d82-4f6c-9c1a-3504e6800f23' \
  -H 'X-Auth-Token: 73b09dcc-9974-402e-bacc-7128e5d0ed62' \
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
