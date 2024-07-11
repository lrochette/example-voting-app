#! /bin/bash


echo "Tests are running"
num_tests=${NB_TESTS}
test_rate=${TEST_RATE}
suite_threshold=${THRESHOLD}
error=0
success=0


# Generate random questions and answers
for ((i=1; i<=$num_tests; i++)); do
    rand_num=$((RANDOM % 100 + 1))
    if  ((rand_num < test_rate ))
    then
      echo "Test $i: FAILED ($rand_num)"
      ((error++))
    else
      echo "Test $i: PASSED ($rand_num)"
      ((success++))
    fi
#    sleep 1
done
success_rate=$((success * 100 / num_tests))

echo ""
echo "Success Rate: $success_rate"
if ((success_rate < suite_threshold))
then
  echo "Test Suite: FAILED"
  exit 1
else
  echo "Test Suite: PASSED"
  exit 0
fi
