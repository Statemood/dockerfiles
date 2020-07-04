# Elasticsearch Cluster

#### Based from https://github.com/pires/kubernetes-elasticsearch-cluster


## Nodes

| ROLE    | PORT          | DATA  |
| -       | :-:           | :-:   |
| Client  | 9200          | No    |
| Master  | 9300          | No    |
| Data    | 9300          | YES   |

## Start Cluster

#### 1. Create Service 

    kubectl create -f es-service.yaml


#### 2. Create Master node

    kubectl create -f es-master.yaml

  - Wait until the pod to be ready

#### 3. Create Client node

    kubectl create -f es-client.yaml

#### 4. Create Data node

    kubectl create -f es-data-hot.yaml
