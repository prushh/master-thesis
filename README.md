# Master's thesis

__Title__: Exploring the Effectiveness of AWS Lambda and Knative in a Serverless Web Crawler: A Comparative Study

__Author__: Davide Pruscini

__Supervisor__: Prof. Gianluigi Zavattaro

__Co-supervisors__: Eng. Emanuele Casadio, Dr. Matteo Trentin

__Academic Year__: 2022/2023

__University__: Alma Mater Studiorum - University of Bologna

__Degree course__: Computer Science

## Abstract

The Internet has become a key resource for accessing and sharing information. However, not all content found on it can be considered legitimate, and using tools such as web crawlers can help search for violations. In this thesis, carried out in collaboration with Kopjra, we aim to develop a web crawler application capable of automatically visiting a website, extracting URLs and indexing the HTML documents of its web pages, so as to enable keyword searches. We decided to compare two serverless implementations based on AWS Lamba and Knative, with a third microservice-based one that exploits the resources made available by Kubernetes. It is also possible to choose between two search methodologies: HTTP requests or Browser automation. To support the application, two microservices were developed, comprising the backend and frontend, as well as the deployment of an Elasticsearch cluster, which is necessary for proper ingestion of the content of web pages. Thanks to a series of tests, it is possible to compare the different implementations and understand the critical issues of each.

## System Architecture

![High level architecture](/images/methodology/system_architecture_general_zoom.png)

### Implementations

<details>
  <summary>AWS Lambda</summary>

  ![AWS architecture](/images/methodology/architecture_krawler_aws_zoom.png)
</details>
<details>
  <summary>Knative</summary>

  ![Knative architecture](/images/methodology/architecture_krawler_kn_zoom.png)
</details>
<details>
  <summary>Kubernetes</summary>

  ![Kubernetes architecture](/images/methodology/architecture_krawler_pod_zoom.png)
</details>

## Thesis

You can *download or view* the .pdf file of the thesis [here](https://github.com/prushh/master-thesis/releases/download/submitted/pruscini-davide-master-thesis.pdf). Please note that this file will never be updated.

## License

This project is licensed under the **CC BY-NC-ND 4.0 License** - see the [AMSLaurea page](https://amslaurea.unibo.it/id/eprint/30888) for details.

## Acknowledgement

The template's skeleton was taken from [jjocram/master-thesis](https://github.com/jjocram/master-thesis).
