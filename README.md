# Ultimate Windows Admin Utility

Comprehensive Windows batch script for system diagnostics, monitoring, reporting, and maintenance.

## Functions

### System and Hardware
- **Quick system status**  
  Displays live CPU, RAM, and disk usage.
- **Full hardware audit**  
  Generates a detailed system report (CPU, RAM, disks, devices, processes, events).
- **System information**  
  Shows OS, BIOS, and hardware details.
- **CPU / Memory / Disk analysis**  
  Detailed breakdown of performance and capacity.
- **Device problem detection**  
  Lists hardware with error states.
- **Process monitoring**  
  Top CPU and memory-consuming processes.
- **Event log analysis**  
  Recent critical and error system events.

---

### Power and Battery
- **Power status overview**  
  Shows battery and power plan information.
- **Battery report**  
  Generates Windows battery diagnostics report.
- **Energy report** *(Admin)*  
  Detects power inefficiencies.
- **Sleep study** *(Admin)*  
  Analyzes sleep behavior (if supported).
- **Wake analysis**  
  Identifies wake sources and timers.
- **Power plan management** *(Admin)*  
  Switch between Balanced, High Performance, and Power Saver.
- **Hibernate control** *(Admin)*  
  Enable or disable hibernation.

---

### Network, Domain and Server Checks
- **Quick network status**  
  Displays full IP configuration.
- **Domain checks**  
  - Ping
  - DNS / NS / MX lookup
  - Traceroute
  - Port 80 / 443 tests
- **Server checks**  
  - Ping, DNS, reverse lookup
  - SMB (445), RDP (3389), WinRM (5985)
  - HTTP/HTTPS connectivity
  - SQL port (1433)
  - Network share check (`net view`)
- **Custom targets**  
  Configure domain and server dynamically.
- **Report generation**  
  Saves detailed domain/server diagnostics.

---

### SQL Browser and SQL Express
- **SQLBrowser service check**  
  Status, configuration, and startup type.
- **Service management** *(Admin)*  
  Set startup to automatic and start service.
- **SQL instance detection**  
  Lists installed SQL instances.
- **Installation details**  
  Retrieves version, edition, and registry data.
- **SQL report generation**  
  Creates full diagnostic report.

---

### User Accounts and Profile Management
- **User and profile listing**  
  Displays local and domain profiles.
- **Profile analysis**  
  Last usage, inactivity, and classification.
- **Profile size calculation**  
  Storage usage per profile.
- **Whitelist support**  
  Protects profiles containing `ADMP` or `Admin`.
- **Delete profile** *(Admin)*  
  Clean removal using Windows API.
- **Delete local account** *(Admin)*  
  Removes local user accounts.
- **Delete domain profiles** *(Admin)*  
  Bulk removal of external profiles.
- **Delete old domain profiles** *(Admin)*  
  Removes only profiles older than defined threshold (default: 60 days).
- **Loaded profile protection**  
  Active profiles are skipped automatically.
- **User report generation**

---

### Cleanup and Maintenance
- **Quick junk scan**  
  Estimates size of common temp locations.
- **Detailed junk analysis**  
  Includes cache, crash dumps, and WER data.
- **User temp cleanup**
- **Windows temp cleanup** *(Admin)*
- **Prefetch cleanup** *(Admin)*
- **Recycle bin cleanup**
- **Windows Update cache cleanup** *(Admin)*
- **DNS cache flush**
- **Thumbnail cache cleanup**
- **Full cleanup routine**
- **Cleanup report generation**

---

### Full Health Report
- **Combined system report**  
  Aggregates key data from all modules:
  - System and hardware
  - Network and connectivity
  - Power configuration
  - SQL services
  - User profile summary
  - Cleanup analysis
  - Event logs

---

## Output

All reports are stored in: Desktop\AdminToolkitReports


Organized into:
- System
- Power
- Network
- SQL
- Users
- Cleanup

---

## Notes

- Some features require **administrator privileges**.
- Behavior may vary depending on system configuration and available components.
- Designed for modular usage – each section can be used independently.

