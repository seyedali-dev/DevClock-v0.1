# Package spring-boot application, and Build a dockerfile for all services by simply running the script.

$rootFolder = "D:\Skill-Development\Spring-boot-Tutorial\source-code\Resume-Projects\DevClock-v0.1"

$services = @(
    @{Name = "eureka"; Folder = "Discovery-Server"},
    @{Name = "api-gateway"; Folder = "Api-Gateway"},
    @{Name = "authentication"; Folder = "Authentication-Service"},
    @{Name = "time-entry"; Folder = "Time-Entry-Service"},
    @{Name = "project"; Folder = "Project-Service"},
    @{Name = "task"; Folder = "Task-Service"},
    @{Name = "report"; Folder = "Report-Service"}
)

foreach ($service in $services) {
    $serviceName = $service.Name
    $serviceFolder = Join-Path $rootFolder $service.Folder

    Write-Host "Building $serviceName in $serviceFolder" -ForegroundColor Green

    Push-Location $serviceFolder
    try {
        # Run Maven clean install
        Write-Host "Running 'mvn clean install' for ---$serviceName---" -ForegroundColor Yellow
        mvn clean install
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Maven build failed for $serviceName. Skipping Docker build." -ForegroundColor Red
            continue
        }

        # Build Docker image
        Write-Host "Building Docker image for ---$serviceName--- in ==> '$serviceFolder'" -ForegroundColor Yellow
        docker build -t "dukeofjava/$($serviceName):0.0.1-SNAPSHOT" .
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Successfully built Docker image for $serviceName" -ForegroundColor Green
        } else {
            Write-Host "Failed to build Docker image for $serviceName" -ForegroundColor Red
        }
    }
    finally {
        Pop-Location
    }

    Write-Host ""  # Empty line for better readability
}

Write-Host "All builds completed." -ForegroundColor Cyan