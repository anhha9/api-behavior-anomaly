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

## Main insights
By cleaning the data and through exploratory data analysis, we found out that anomalous behavviour patterns are characterised by:
- Higher API access durations (measured in seconds)
- Higher V-session duations (measured in minutes)
- Traffic coming from data centers

## Engineered features
- mean_page_rank and std_page_rank (standard deviation of page rank): These features measure the importance of a node in a graph according to its connections.
- std_out_degree (standard deviation of out degree): Concerning directed graph (the type of graph we have here), out-degree indicates how many other nodes each node directly points to.
***Note about the distinction between PageRank and out-degree***: *PageRank is a global metric, influenced by the ranks of the nodes linking to it and their respective out-degrees. Out-degree is a local metric, focusing only on the immediate neighbors a node connects to.*

## Model selection
The best performing model was the Histogram Gradient Boosting Classifier with the following parameters:
{
    learning_rate: 0.02294131897623665,
    max_iter: 78,
    max_leaf_node: 13
}

## Business metric
Concerning anomalous API call prediction, the accuracy and F1-score of the classifier typicall fall into these thresholds:
- Accuracy: 85%-95% [Xin et al., 2023](https://journalofcloudcomputing.springeropen.com/articles/10.1186/s13677-022-00383-6?)
- F1-score: 0.75-0.90 [Aharon et al., 2024](https://arxiv.org/html/2405.11247v1?)
With our best Histogram Gradient Boosting Classifier, the metrics are:
- Accuracy: 99.76%
- F1-score: 98.12%
Hence, the chosen model performed well according to business metric standards.


## Deployment
### Step 1: Build the Docker image
Clone the repository and go to the folder with the Dockerfile. Then run the following command to build the image.

docker build -t hgbt_model:latest .

### Step 2: Send the request
To test if the API is working, you can run the app_model.py file in the app folder.

python app_model.py