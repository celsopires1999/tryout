FROM "mcr.microsoft.com/devcontainers/base:jammy"

RUN wget https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz

RUN tar xf zig-linux-x86_64-0.13.0.tar.xz

RUN rm zig-linux-x86_64-0.13.0.tar.xz

USER vscode

RUN echo 'export PATH="$HOME/zig-linux-x86_64-0.13.0:$PATH"' >> ~/.bashrc
