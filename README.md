# Assurity Performance Engineer Test Assignment

This repository contains the performance test suite created as part of the Performance Engineer application process for Assurity.
## Test Script Details & Configuration
### Applicant Information
- Applicant Name: Jay Javier Jr
- Tool Used: Apache JMeter
- Test Type: API Performance Test – Transactional Load Test – Catalogue Request

### Assumptions
The user executing this test suite is expected to have the following installed on their machine:
- Java Runtime Environment (JRE)
- Apache JMeter 5.6.3 or later

### Repository Setup
- **Clone the Repository**:
  - Clone this repository to your local machine. Recommended path `C:\Temp\TestAssignment`
- **Verify Repository Structure**:
  - <img width="70%" height="70%" alt="image" src="https://github.com/user-attachments/assets/fd3fc6aa-78fd-468b-93e5-97cc2939041b" />
  - Verify that `\data` subfolder contains `CategoryID.csv`
  - <img width="70%" height="70%" alt="image" src="https://github.com/user-attachments/assets/b0470d7b-2302-4803-a792-4b96400a5065" />

- **Configure JMeter Path**:
  - Open `LoadTestRunner.bat` using Notepad or any text editor
    - Change `C:\apache-jmeter-X.X\bin` to your local JMeter `bin` directory
    - Change `C:\Temp\TestAssignment` to the location where the repository was cloned.
    - <img width="70%" height="70%" alt="image" src="https://github.com/user-attachments/assets/fcd51081-0d33-4f15-839c-a260329f9842" />


_For any test configuration question, feel free to reach to the Applicant - Jay Javier Jr_

## Test Execution
### Instruction to run the test
- **Open the Repository Folder**:
  - Navigate to your local repository directory.
- **Update Test Configuration**:
  - Edit `LoadTestRunner.bat` and update the following configuration values as needed
    - Number of Threads (VUsers)
    - Ramp-up Time
    - Test Duration
    - Throughput Target    
    - <img width="50%" height="50%" alt="image" src="https://github.com/user-attachments/assets/adc88348-b126-40ce-9ddc-bc7b7378d22b" />


- **Run the Test**:
  - Double-click `LoadTestRunner.bat` or execute it via `Command Prompt`.
    - The script will
      - Remove previous test artefacts
      - Execute the `JMeter` test in `non-GUI mode`
      - Generate a `.jtl` result file
      - Generate an `HTML report`
 
### Test Artefacts
- **Main Files**
  - `JayJavier_AssurityTestAssignment.jmx` - The main JMeter test script used to execute the performance test.
  - `LoadTestRunner.bat` - Batch runner used to execute JMeter in non-GUI mode with configurable parameters.
- **Supporting Folders**
  - `/data` - Contains test data files used during execution.
  - `/extract` - Contains CSV files with extracted Promotion IDs captured during test execution.
  - `/results` - Contains the latest test execution artefacts:
    - `results.jtl`
    - `jmeter.log`
    - `HTML Report`

_Note: Previous test results are automatically deleted and replaced whenever a new test run is triggered._

## Results Analysis & Test Report
### Test Objective
- The objective of this test suite is to:
  - Validate that the Catalogue API can sustain a throughput target of **10 API calls per minute**
  - Verify that **90% of API responses complete within 500 ms**
  - Extract Promotion IDs from the API response into a CSV file for reporting and validation purposes
 
### Test Execution Summary
#### Throughput & Load Behaviour
- The test was configured with **5 virtual users (threads)** based on the requirement that thread count should be equal to half the number of Category IDs in the supplied test data.
- The test ramp-up was configured at **1 virtual user per second**, resulting in a total ramp-up duration of **5 seconds**.
- A **Constant Throughput Timer (CTT)** was used to maintain a target throughput of **10 API calls per minute** during the steady-state period.
- The overall test duration was configured to **65 seconds**, consisting of:
  - **5 seconds ramp-up period**
  - **60 seconds steady-state execution period**
- The test successfully achieved the target throughput requirement throughout the execution.

#### API Response Time Analysis
- The Catalogue API recorded an average response time of **135.87 ms**
- The 90th percentile (P90) response time was recorded at **484.20 ms**
- The test met the non-functional requirement of maintaining API response times below **500 ms** for 90% of transactions.
- No significant response time degradation was observed during the steady-state execution period.
- <img width="100%" alt="Response Time Report" src="https://github.com/user-attachments/assets/e713836c-bce7-4c14-ac03-ecab7567a3e9" />

#### Validation & Functional Verification
- Response validation was implemented as part of the test suite to verify expected API behaviour.
- Two requests were intentionally marked as failed due to validation checks against Catalogue `6331`.
- The API response for these requests returned: "CanRelist": false
- <img width="1531" height="248" alt="image" src="https://github.com/user-attachments/assets/51658287-5f78-4a10-a963-5176f127c18c" />

#### NFR Conformance Report

| NFR ID | Description | Status | Actual Result | Remarks |
|---|---|---|---|---|
| NFR-01 | Test should support VUsers (Threads) equal to half the count of Category IDs in the test data | ✅ Met | Threads: 5 | Test data contains 10 Category IDs, resulting in 5 VUsers |
| NFR-02 | Test should ramp up at one VUser per second | ✅ Met | Ramp-up: 5 seconds | Ramp-up configured to match 1 VUser per second |
| NFR-03 | Test should achieve 10 API calls during the 1-minute steady-state period | ✅ Met | Duration: 65 seconds<br>TPM: 10 | Additional 5 seconds allocated for ramp-up before the 60-second steady-state duration |
| NFR-04 | 90% of API responses should complete within 500 ms | ✅ Met | P90: 484.20 ms | Achieved target response time below 500 ms<br><p align="center"> <img width="100%" height="100%" alt="image" src="https://github.com/user-attachments/assets/e713836c-bce7-4c14-ac03-ecab7567a3e9" /> </p>
 |

   
