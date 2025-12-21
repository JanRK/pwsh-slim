FROM debian:stable-slim

ARG DEBIAN_FRONTEND=noninteractive

ENV DEBIAN_FRONTEND=noninteractive \
		POWERSHELL_CLI_TELEMETRY_OPTOUT=1 \
		POWERSHELL_TELEMETRY_OPTOUT=1 \
		DOTNET_CLI_TELEMETRY_OPTOUT=1 \
		DOTNET_TELEMETRY_OPTOUT=1 \
		POWERSHELL_UPDATECHECK=Off \
		POWERSHELL_UPDATECHECK_OPTOUT=1

RUN apt-get update; \
		apt-get install -y --no-install-recommends apt-transport-https ca-certificates; \
		apt-get purge -y --auto-remove; apt-get clean; rm -rf /var/lib/apt/lists/*; \
        aptlists=$(find /etc/apt -type f \( -name "*.list" -o -name "*.sources" \)); \
        for filename in $aptlists; do \
            sed -i 's|https\?://ftp.acc.umu.se|https://deb.debian.org|g' $filename; \
            sed -i 's|https\?://ftp.dk.debian.org|https://deb.debian.org|g' $filename; \
            sed -i 's|https\?://ftp.debian.org|https://deb.debian.org|g' $filename; \
            sed -i 's|https\?://deb.debian.org|https://deb.debian.org|g' $filename; \
            sed -i 's|https\?://storage.googleapis.com|https://storage.googleapis.com|g' $filename; \
            sed -i 's|https\?://packages.cloud.google.com|https://packages.cloud.google.com|g' $filename; \
            sed -i 's|https\?://apt.llvm.org|https://apt.llvm.org|g' $filename; \
            sed -i 's|https\?://repo.mysql.com|https://repo.mysql.com|g' $filename; \
            sed -i 's|https\?://apt.postgresql.org|https://apt.postgresql.org|g' $filename; \
            sed -i 's|https\?://raspbian.raspberrypi.org/raspbian/|https://mirrors.dotsrc.org/raspbian/raspbian/|g' $filename; \
            sed -i 's|https\?://archive.raspberrypi.org/debian/|https://mirrors.ustc.edu.cn/archive.raspberrypi.org/debian/|g' $filename; \
            sed -i 's|https\?://apt.armbian.com|https://apt.armbian.com|g' $filename; \
            sed -i 's|https\?://security.debian.org/debian-security|https://deb.debian.org/debian-security|g' $filename; \
            sed -i 's|https\?://security.ubuntu.com/ubuntu|https://security.ubuntu.com/ubuntu|g' $filename; \
            sed -i 's|https\?://eu-stockholm-1-ad-1.clouds.archive.ubuntu.com/ubuntu|https://eu-stockholm-1-ad-1.clouds.archive.ubuntu.com/ubuntu|g' $filename; \
        done; \
		apt-get update; \
		apt-get install -y --no-install-recommends wget curl gnupg; \
		apt-get purge -y --auto-remove; apt-get clean; rm -rf /var/lib/apt/lists/*



# Powershell
RUN mkdir -p /etc/apt/keyrings /etc/apt/preferences.d /etc/apt/sources.list.d && \
        for i in 1 2 3 4 5; do \
            curl --connect-timeout 10 --max-time 30 -fsSL https://packages.microsoft.com/keys/microsoft.asc -o /etc/apt/keyrings/legacy.packages.microsoft.com.asc && break || sleep 5; \
        done && \
        for i in 1 2 3 4 5; do \
            curl --connect-timeout 10 --max-time 30 -fsSL https://packages.microsoft.com/keys/microsoft-rolling.asc -o /etc/apt/keyrings/packages.microsoft.com.asc && break || sleep 5; \
        done

# ADD ./etc/apt/preferences.d/01-packages.microsoft.com.pref /etc/apt/preferences.d/01-packages.microsoft.com.pref
COPY ./etc/apt/. /etc/apt/

RUN apt-get update; \
		apt-get install -y --no-install-recommends powershell; \
		apt-get purge -y --auto-remove; apt-get clean; rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
