#!/bin/bash

echo "Starting compilation..."

# Download model
aws s3 cp s3://my-bucket/model.tar.gz ./model.tar.gz

# Extract
tar -xzf model.tar.gz

# Do something with model
echo "Processing model..."
python3 << 'EOF'
import tensorflow as tf
model = tf.saved_model.load('./model')
print("Model loaded!")
EOF

# Upload result
tar -czf output.tar.gz model/
aws s3 cp output.tar.gz s3://my-bucket/output/

echo "Done!"
