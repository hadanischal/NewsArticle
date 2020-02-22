#!/bin/sh

# Define output file. Change "$PROJECT_DIR/Tests" to your test's root source folder, if it's not the default name.
PROJECT_DIR="."
PROJECT_NAME="NewsArticle"
PROJECT_NAME_TESTS="NewsArticleTests"
PODS_ROOT="$PROJECT_DIR/Pods"
OUTPUT_FILE="$PROJECT_DIR/${PROJECT_NAME_TESTS}/GeneratedMocks.swift"
echo "Generated Mocks File = $OUTPUT_FILE"

# Define input directory. Change "$PROJECT_DIR" to your project's root source folder, if it's not the default name.
INPUT_DIR="$PROJECT_DIR/${PROJECT_NAME}"
echo "Mocks Input Directory = $INPUT_DIR"

# Generate mock files, include as many input files as you'd like to create mocks for.
${PODS_ROOT}/Cuckoo/run generate --testable "${PROJECT_NAME}" \
--output "${OUTPUT_FILE}" \
"$INPUT_DIR/APIWrappers/GetNewsHandlerProtocol.swift" \
"$INPUT_DIR/APIWrappers/GetSourcesHandlerProtocol.swift" \
"$INPUT_DIR/FileManagerHandler/CategoriesHandlerProtocol.swift" \
"$INPUT_DIR/FileManagerHandler/FileManagerHandlerProtocol.swift" \
"$INPUT_DIR/Networking/WebServiceProtocol.swift"

# ... and so forth
