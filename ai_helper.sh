#!/bin/bash

if [[ -z "${GEMINI_API_KEY:-}" ]]; then
    echo "Error: GEMINI_API_KEY is not set!"
    exit 1
fi

call_ai() {
    local prompt="$1"
    EXTRA_PROMPT="(Respond briefly and clearly.)"

    curl -s "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent" \
      -H "x-goog-api-key: $GEMINI_API_KEY" \
      -H "Content-Type: application/json" \
      -X POST \
      -d "{
        \"contents\": [
          {
            \"parts\": [
              {
                \"text\": \"$prompt $EXTRA_PROMPT\"
              }
            ]
          }
        ]
      }" | jq -r '.candidates[0].content.parts[0].text // "No response"'
}
