# ============================================================================ # Dockerfile — recipe for building the course image # ============================================================================ 
# A Dockerfile is a text file with step-by-step instructions that Docker 
# or GitHub Codespaces reads from top to bottom to build an image. #
 # A Docker image is like a frozen template of a Linux system with all the 
 # tools and settings already prepared. When the course environment starts, 
 # Docker creates a running container from that image. 
 # The image is the blueprint, and the container is the house built from it.
 # We can create many containers from the same image, and deleting one 
 # container does not delete the image. # 
 # Docker builds images in layers. Each instruction such as FROM, ENV, or RUN
 # creates a new layer. Docker can reuse cached layers when the previous 
 # instructions have not changed, so instruction order matters: stable steps 
 # should appear earlier, and frequently changed steps should appear later. 
 # This makes rebuilds faster and keeps the image more efficient. 
 # Docker / container lab idea — BHB Ch.3
 # FROM: base image used to build this course environment
 # Instead of creating a Linux system from zero, this image starts from the # official Kali Linux rolling image.  
 # A base image provides the initial filesystem, package manager, and Linux 
 # environment. Kali is useful in this course because it is a Debian-based 
 # distribution commonly used for cybersecurity labs networking tools and 
 # command-line practice. 
 # The "rolling" version means Kali receives continuous updates. 
 # Everything installed below will be added on top of this base image. 
 # Kali / lab setup — BHB Ch.3 FROM kalilinux/kali-rolling:latest
 # ---------------------------------------------------------------------------- 
# ENV: permanent environment variables inside the container  
# ---------------------------------------------------------------------------- 
# Environment variables are global settings that programs can read from the 
# shell environment. They are usually written in uppercase by convention. 
# Environment variables — BHB Ch.1 #
# # DEBIAN_FRONTEND=noninteractive:
# This tells Debian's package tools not to ask interactive questions during 
# installation. Docker builds must run automatically, so interactive prompts 
# could freeze the build. # 
# LANG=es_ES.UTF-8: # This sets the default language and character encoding for programs. 
# UTF-8 allows accents, ñ, and other special characters to display correctly. # 
# LC_ALL=es_ES.UTF-8: 
# This forces all locale categories to use the Spanish UTF-8 locale, helping 
# commands behave consistently with language, sorting, and text formatting. 
#
# TERM=xterm-256color: 
# This tells terminal programs that the terminal supports 256 colors. This 
# helps editors and command-line tools display colors correctly. # 
# The backslash "\" continues the ENV instruction on the next line, making 
# the Dockerfile easier to read. ENV DEBIAN_FRONTEND=noninteractive \ LANG=es_ES.UTF-8 \ LC_ALL=es_ES.UTF-8 \ TERM=xterm-256color 
# ---------------------------------------------------------------------------- 
# Pre-answer an interactive Wireshark/tshark installation question 
# ---------------------------------------------------------------------------- 
# The wireshark-common package may ask whether non-root users should be able 
# to capture network packets. Since Docker builds cannot stop and wait for 
# keyboard input, this command stores the answer before the package is installed. 
# 
# echo writes the answer, and the pipe "|" sends that output as input to 
# debconf-set-selections. This is an example of connecting commands through 
# standard output and standard input. # Streams and pipes — BHB Ch.1 RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \ | debconf-set-selections 
# ---------------------------------------------------------------------------- 
# RUN: install the course software during the image build 
# ---------------------------------------------------------------------------- 
# This block installs all required packages in one RUN instruction. 
# 
# apt-get update: 
# Downloads the latest package index from the configured repositories. 
# It does not install software; it only updates the list of available packages. 
# 
# apt-get install: 
# Downloads and installs the selected packages. 
# 
# -y: # Automatically answers "yes" to installation prompts. 
# 
# --no-install-recommends: # Installs only the required packages, avoiding optional recommended packages. 
# This keeps the image smaller. # # Why one large RUN block? 
# Each RUN instruction creates a new image layer. Using one large RUN reduces 
# the number of layers and allows cleanup commands to remove temporary files 
# in the same layer, which helps reduce final image size. 
# # The "&&" operator means that the next command runs only if the previous 
# command succeeds. This prevents Docker from continuing after a failed step. 
# The "\" character continues the command on the next line for readability. 
# Control operators — BHB Ch.1 RUN apt-get update && apt-get install -y --no-install-recommends \ \ 
# === Text editors and shells === 
# neovim and vim are terminal text editors. 
# zsh and bash-completion improve the interactive shell experience. neovim \ vim \ zsh \ bash-completion \ \ 
# === Fourth-generation / text-processing tools === # perl is a scripting language often used for text processing. 
# make automates tasks using Makefiles. 
# gawk processes structured text using patterns and fields. 
# sed edits text streams. # grep filters lines that match a pattern. 
# Text processing — BHB Ch.2 perl \ make \ gawk \ sed \ grep \ \ 
# === Basic UNIX utilities === # coreutils includes common commands such as cat, ls, head, tail, sort, 
# cut, tr, and many others. 
# findutils provides find and xargs. 
# procps provides process tools such as ps, top, and kill. 
# less is used to read long text output page by page. 
# tree displays directories in a tree format. 
# jq processes JSON data from the command line. 
# UNIX commands — BHB Ch.1 coreutils \ findutils \ procps \ less \ tree \ jq \ \ 
# === Manual pages === 
# man-db provides the man command. 
# manpages and manpages-posix provide documentation for Linux and POSIX 
# commands. This is useful because students can check command syntax 
# directly from the terminal. man-db \ manpages \ manpages-posix \ \ 
# === Basic networking and download utilities === 
# curl and wget download data from URLs. # git is used for version control. 
# git-lfs handles large files in Git repositories. 
# ca-certificates helps tools verify HTTPS certificates. 
# locales allows the system to generate language and encoding settings. curl \ wget \ git \ git-lfs \ ca-certificates \ locales \ \ 
# === Bash script linter === 
# shellcheck analyzes shell scripts and reports common errors or unsafe 
# patterns. This helps students write better Bash scripts. shellcheck \ \ 
# === Network discovery and scanning === # nmap is a common port scanner used for network discovery. 
# masscan is used for very fast scanning of large IP ranges. 
# Network lab tools — BHB Ch.3 nmap \ masscan \ \ 
# === Packet capture and analysis === 
# tcpdump captures network packets from the terminal. 
# tshark is the command-line version of Wireshark. tcpdump \ tshark \ \ 
# === Additional networking utilities === 
# netcat-traditional can create simple TCP/UDP connections. 
# socat connects data streams between files, sockets, and processes. 
# dnsutils provides DNS tools such as dig and nslookup. 
# whois queries domain registration information. 
# traceroute and mtr-tiny help analyze network paths. 
# iproute2, net-tools, and iputils-ping provide basic network commands. netcat-traditional \ socat \ dnsutils \ whois \ traceroute \ mtr-tiny \ iproute2 \ net-tools \ iputils-ping \ \ 
# === Tor and proxy-related tools === 
# tor is the client for the Tor network. 
# torsocks can route command traffic through Tor. 
# proxychains4 can force programs to use proxy chains. 
# obfs4proxy helps obfuscate Tor traffic in restricted environments. tor \ torsocks \ proxychains4 \ obfs4proxy \ \ 
# === HTTP client === 
# httpie is a readable command-line HTTP client. It is useful for learning 
# and testing web requests. httpie \ \ 
# After installing packages, this command enables the Spanish UTF-8 locale. 
# sed -i edits /etc/locale.gen in place. It removes the "#" from the 
# es_ES.UTF-8 line so the locale becomes active. # locale-gen then generates the locale files used by the system. 
# sed / stream editing — BHB Ch.2 && sed -i 's/
# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \ && locale-gen \ \ 
# apt-get clean removes downloaded package files that are no longer needed. 
# rm -rf /var/lib/apt/lists/* removes the package index files downloaded 
# by apt-get update. # 
# Cleanup is done in the same RUN instruction because files deleted in a 
# later layer would still exist in earlier layers and would not reduce the 
# final image size effectively. && apt-get clean \ && rm -rf /var/lib/apt/lists/* 
# ---------------------------------------------------------------------------- 
# SHELL: choose the interpreter for future RUN instructions 
# ---------------------------------------------------------------------------- 
# Docker normally uses /bin/sh -c for RUN commands. /bin/sh is more limited 
# than Bash on many systems. # 
# This course studies Bash, so using /bin/bash -c makes later RUN commands 
# behave closer to the shell syntax used in the course, including features 
# such as arrays, [[ tests ]], and other Bash-specific behavior. 
# Shell / Bash basics — BHB Ch.1 SHELL ["/bin/bash", "-c"] 
# ---------------------------------------------------------------------------- 
# WORKDIR: default working directory 
# ---------------------------------------------------------------------------- 
# WORKDIR sets the directory where later commands will run by default. 
# In GitHub Codespaces and devcontainers, repositories are usually mounted 
# under /workspaces/<repository-name>. # 
# Setting /workspaces as the working directory makes the terminal start near 
# the course files. WORKDIR /workspaces 
# ---------------------------------------------------------------------------- 
# Git configuration for the container 
# ---------------------------------------------------------------------------- 
# These settings apply to Git at the system level inside the container. # 
# safe.directory '*': 
# Allows Git to trust repositories mounted inside /workspaces. This avoids 
# ownership warnings that can happen because the repository files may have a 
# different user ID than root inside the container. # # init.defaultBranch main: 
# Makes new repositories use "main" as the default branch name. # 
# pull.rebase false: # Makes git pull use merge behavior by default instead of rebase. # 
# git lfs install --system: 
# Installs Git LFS hooks system-wide so repositories that use large file 
# storage work correctly inside the container. RUN git config --system --add safe.directory '*' \ && git config --system init.defaultBranch main \ && git config --system pull.rebase false \ && git lfs install --system 
# ---------------------------------------------------------------------------- 
# Change root's default shell to zsh 
# ---------------------------------------------------------------------------- 
# chsh changes the login shell for a user. 
# This sets root's default shell to zsh, so interactive sessions can start 
# with zsh instead of the system default shell. # 
# This is different from the Dockerfile SHELL instruction above: 
# SHELL controls how Docker executes future RUN commands during the build, 
# while chsh changes the interactive shell for the user. RUN chsh -s /usr/bin/zsh root 
# ---------------------------------------------------------------------------- 
# Configure the zsh prompt using a here-document 
# ---------------------------------------------------------------------------- 
# This RUN command appends several lines to /root/.zshrc. # 
# The <<'EOF' syntax is a here-document, also called a heredoc. A heredoc sends 
# multiple lines of text as input to a command until the ending marker is found. 
# Here, cat appends that text to the .zshrc file. # 
# The single quotes around 'EOF' prevent variable expansion during the Docker 
# build, so the prompt symbols remain literal until zsh reads them later. # # The PROMPT line controls how the zsh prompt looks: # %n = username # %m = host name # %~ = current directory # %# = # for root or % for a normal user # # Redirection and heredoc — BHB Ch.1 RUN cat >> /root/.zshrc <<'EOF' # Course prompt for zsh. PROMPT='%n@%m:%~%# ' # Useful aliases for interactive work. alias ll='ls -la' alias grep='grep --color=auto' EOF # ---------------------------------------------------------------------------- # CMD: default command when the container starts # ---------------------------------------------------------------------------- # CMD defines what runs when a container starts. # # This is different from RUN: # RUN executes during the image build and creates image layers. # CMD executes when a container is launched from the image. # # Starting zsh gives the user an interactive shell by default. CMD ["/usr/bin/zsh"]