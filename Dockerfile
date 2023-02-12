FROM mcr.microsoft.com/powershell:ubuntu-jammy AS final

# Set working directory
WORKDIR /app

# Copy scripts to container
COPY ./scripts/* /app/scripts/

RUN chmod a+x -R /app/scripts/*

# Install packages and dependencies
RUN /app/scripts/packages.sh \
    && /app/scripts/install-oh-my-posh.sh \
    && git clone --depth 1 https://github.com/MartinSGill/Profile.git /usr/local/share/powershell/Modules/MyProfile \
    && /app/scripts/configure-profile.ps1 \
    && /app/scripts/cleanup.sh

# Set shell to PowerShell and configure profile
ENV SHELL pwsh
