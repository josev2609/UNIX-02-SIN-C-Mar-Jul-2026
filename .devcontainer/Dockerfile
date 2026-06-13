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