#!/bin/bash

model_dir="birdclef-2023-offline-models"


rm ./$model_dir/*.pkl
new_model=`ls -rt *.pkl | grep -v indices.pkl$ | tail -1`
echo "Sending $new_model to kaggle offline models dataset"
cp $new_model ./$model_dir/
kaggle datasets version -p ./$model_dir -m "$1"
mv *.pkl ./models/
