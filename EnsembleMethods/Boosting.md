Boosting
===================
Multiple models developed in sequence by assigning higher weights (boosting) for those training cases that 
are difficult to classify

- Generate the first model
- Repeat
Weight the training data such that the misclassified cases get  higher weights
Generate the next model
Combine predictions from individual models (weighted by accuracy of the models)
