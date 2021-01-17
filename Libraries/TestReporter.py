import requests
from robot.libraries.BuiltIn import BuiltIn

def report_event(testcase_id, teststep_description, actual_result, status, final="False"):
    base_url = BuiltIn().get_variable_value('${REPORT_URL}'),
    requests.post(f"{base_url}/add_step_result", {
        "testcase_id": testcase_id,
        "test_cycle_id": BuiltIn().get_variable_value('${TEST_CYCLE_ID}'),
        "teststep_description": teststep_description,
        "actual_result": actual_result,
        "status": status,
        "final": final
    })
