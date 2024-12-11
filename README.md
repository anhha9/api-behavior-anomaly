# API Security: Access Behavior Anomaly
## Dataset
The dataset for this project can be accessed through [Kaggle](https://www.kaggle.com/datasets/tangodelta/api-access-behaviour-anomaly-dataset?resource=download) (licensed under GPL-2)

Applications built on distributed microservices are commonly accessed through APIs. The author of this dataset gathered sequences of API calls from an application and organized them into a graph structure. From this graph, they derived typical API access patterns (i.e., sequences of API calls) and calculated user access metrics to help classify these behaviors. Additionally, the author of this dataset manually labeled a subset of these behavior patterns as a training set and provided the remaining sequences for classification.


## Objectives
### Overacrching objective:
The overall objective of this project is *to develop a system that is able to detect abnormal behavior from the API calls*
### Sub-objectives:
To achieve this overarcing objective, this project is broken down into 3 sub-objectives:
1. To conduct in-depth exploratory data analysis of both the tabular and graph datasets
2. To engineer new predictive features from the available graphs
3. To develop a supervised-learning model to classify the behaviours into normal and abnormal behaviors

