# CI/CD Security Image Scan

This project demonstrates a CI/CD pipeline with integrated security checks using GitHub Actions. The pipeline includes code checkout, dependency installation, testing, and security scanning for vulnerabilities in Docker images.

## Tools Used
- **GitHub Actions**: For CI/CD pipeline automation.(Jenkins is an option)
- **Bandit**: Static code analysis to identify security issues in Python code.
- **Trivy**: Container and filesystem scanning for vulnerabilities.
- **Snyk**: Scanning dependencies for known vulnerabilities.

## Getting Started
1. **Clone the Repository:**
    ```bash
    git clone https://github.com/yourusername/CI-CD-Security-image-scan.git
    cd CI-CD-Security-image-scan
    ```

2. **Set Up GitHub Actions:**
    - Ensure GitHub Actions is enabled for your repository.

3. **Configure Snyk Token:**
    - Create a Snyk account and integrate it with your GitHub account by following the instructions on Snyk's integration page.
    - Log into your Snyk account and navigate to your account settings.
    - Locate and copy your Snyk API token.
    - Go to your GitHub repository settings.
    - Navigate to Secrets > Actions.
    - Add a new secret named SNYK_TOKEN and paste your Snyk API token as the value.
      This will allow GitHub Actions to authenticate with Snyk and perform security scans on your dependencies.

4. **Push Changes:**
    - Commit and push any changes to trigger the pipeline.

## Directory Structure
```
CI-CD-Security-image-scan/
├── .github/
│   ├── workflows/
│   │   └── ci.yml
├── src/
│   ├── app.py
│   ├── utils.py
│   └── __init__.py
├── tests/
│   ├── test_app.py
│   └── test_utils.py
├── Dockerfile
├── requirements.txt
├── requirements-dev.txt
└── README.md
```

## Running Locally

1. **Create and Activate Virtual Environment:**
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

2. **Install Dependencies:**
    ```bash
    pip install --upgrade pip
    pip install -r requirements.txt
    pip install -r requirements-dev.txt
    ```

3. **Run the Application:**
    ```bash
    python src/app.py
    ```

4. **Run Tests:**
    ```bash
    PYTHONPATH=src pytest --cov=src
    ```

5. **Run Security Checks:**
    ```bash
    bandit -r src/
    trivy fs .
    snyk auth <your-snyk-token>
    snyk test --file=requirements.txt --severity-threshold=high
    ```

## Security Scan Summary

### Snyk Results:
- **Organization:** repo-name
- **Package Manager:** pip
- **Target File:** requirements.txt
- **Project Name:** CI-CD-Security-image-scan
- **Open Source:** No
- **Licenses:** Enabled

- **Scan Result:** Tested 1 dependency for known issues. No vulnerable paths found.

### Trivy Results:
Here are some of the vulnerabilities identified during the scan:

| Library       | Vulnerability         | Severity | Installed Version | Title                                                    |
|---------------|-----------------------|----------|-------------------|----------------------------------------------------------|
| apt           | CVE-2011-3374         | LOW      | 2.6.1             | apt-key in apt, all versions, does not correctly handle...|
| bash          | TEMP-0841856-B18BAF   |          | 5.2.15-2          | Privilege escalation possible to other user than root     |
| bsdutils      | CVE-2022-0563         |          | 2.38.1-5+deb12u1  | Partial disclosure of arbitrary files in chfn and chsh... |
| coreutils     | CVE-2016-2781         |          | 9.1-1             | Non-privileged session can escape to the parent session...|
| gcc-12-base   | CVE-2023-4039         | MEDIUM   | 12.2.0-14         | -fstack-protector fails to guard dynamic stack allocations|
| libexpat1     | CVE-2023-52425        | HIGH     | 2.5.0-1           | Expat: Parsing large tokens can trigger a denial of service|
| libgnutls30   | CVE-2024-28834        | MEDIUM   | 3.7.9-2+deb12u2   | Gnutls: Vulnerable to Minerva side-channel information leak|

For a full list of vulnerabilities and their details, please refer to the Trivy scan output in your CI pipeline logs.



This README provides a clear overview of the project, setup instructions, and summarized security scan results. It is comprehensive for anyone to replicate. 
