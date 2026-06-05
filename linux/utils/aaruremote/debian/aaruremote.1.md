% aaruremote(1) aaru-remote User Manuals
% Nicolas HOUDELOT (nicolas@demosdebs.org),Nat Portillo
% 2026-06-05

# NAME
**aaruremote** - remote server for Aaru, the disk imaging and preservation software

# SYNOPSIS
**aaruremote**

# DESCRIPTION
**aaruremote** is the server component of **Aaru**, a disk imaging and storage media preservation tool.
It receives commands sent by a remote Aaru instance, forwards them to a local device, and returns the data back over TCP/IP.

The primary motivation for **aaruremote** is to provide access to devices on machines that cannot run Aaru directly — older systems, architectures unsupported by .NET, or game consoles.

On startup, **aaruremote** prints the underlying operating system version and the list of available IP addresses, then listens for incoming connections on port **6666/TCP**.

It accepts no command-line options.

## Privileges

**aaruremote** requires access to raw block devices.
When run manually, it should be executed as **root** to access most device types (ATA, SCSI, NVMe, MMC/SD).
When managed by systemd, it runs as the dedicated **aaruremote** user with supplementary groups **disk** and **cdrom**, which grants the necessary device permissions without requiring root.

## Supported device types

Depending on the platform, **aaruremote** supports the following device types:

**ATA (CHS)**
: ATA drives addressed in Cylinder/Head/Sector mode.

**ATA (LBA 28-bit)**
: ATA drives with 28-bit logical block addressing.

**ATA (LBA 48-bit)**
: ATA drives with extended 48-bit logical block addressing.

**ATAPI**
: ATA optical drives (CD, DVD, Blu-ray).

**SCSI**
: Generic SCSI devices, including optical drives and hard disks.

**NVMe**
: NVMe solid-state drives.

**Secure Digital (SD)**
: SD and SDHC memory cards.

**MultiMediaCard (MMC)**
: MMC memory cards.

## Supported buses

Depending on the operating system, **aaruremote** can retrieve bus-specific metadata for: **USB**, **FireWire (IEEE 1394)**, and **PCMCIA**.

## Platform support

| Platform     | Minimum version |
|--------------|----------------|
| Linux        | 2.6            |
| FreeBSD      | 12             |
| macOS        | 10.0           |
| Windows NT   | XP             |
| Nintendo Wii | 4.3            |

# OPTIONS

**aaruremote** takes no options.

# DEVICE URI

From an Aaru client instance, devices exposed by **aaruremote** are accessed using the following URI scheme:

    aaru://<IP_ADDRESS>/<DEVICE_PATH>

For example:

    aaru://192.168.1.10/dev/sda

# EXAMPLES

Start the server (as root):

    sudo aaruremote

From Aaru, list the devices available on the remote machine:

    aaru list-devices aaru://192.168.1.10

Test the connection using the Aaru remote command:

    aaru remote aaru://192.168.1.10

# PROTOCOL

**aaruremote** communicates over a proprietary binary protocol on TCP port **6666**.
Each message begins with an **AaruPacketHeader** containing a magic identifier (`DICR`), a packet identifier (`PCKT`), the message length, the protocol version, and the command type.

The maximum supported protocol version is **2**.

# SYSTEMD SERVICE

A systemd service unit is provided to run **aaruremote** automatically at boot.

To enable and start the service:

    systemctl enable aaruremote
    systemctl start aaruremote

To check its status:

    systemctl status aaruremote

The service runs under the dedicated **aaruremote** user (group **operator**),
with supplementary groups **disk** and **cdrom** to allow device access without root privileges.
It restarts automatically on failure.

Log output is appended to **/var/log/aaruremote.log**.

# FILES

**/etc/systemd/system/aaruremote.service**
: systemd unit file for the aaruremote daemon.

**/var/log/aaruremote.log**
: Log file for standard output and error when running as a systemd service.

# SEE ALSO

**aaru**(1)

Aaru online documentation: https://github.com/aaru-dps/Aaru

# BUGS

No known bugs.
Report bugs at: https://github.com/aaru-dps/Aaru/issues

# COPYRIGHT

Copyright © 2019-2026 Natalia Portillo.

**aaruremote** is free software distributed under the terms of the **GNU General Public License version 3** (GPLv3).
See <https://www.gnu.org/licenses/gpl-3.0.html> for the full license text.
