# Memory Usage Monitoring Script

# Set memory usage warning threshold (in percent)
$threshold = 80

# Get current memory usage information
$memory = Get-CimInstance Win32_OperatingSystem

# Calculate percent of memory used
$usedMemory = (($memory.TotalVisibleMemorySize - $memory.FreePhysicalMemory) / $memory.TotalVisibleMemorySize) * 100
$usedPercent = [math]::Round($usedMemory, 2)

# Display current memory usage
Write-Host "Current memory usage:" $usedPercent "%"

# Compare usage to the threshold and display result
if ($usedPercent -ge $threshold) {
    Write-Host "WARNING: High memory usage!" -ForegroundColor Red
} else {
    Write-Host "Memory usage is normal." -ForegroundColor Green
}
