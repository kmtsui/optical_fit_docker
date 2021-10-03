# optical_fit_docker
Build a optical_fit image and push to docker hub with github actions. 

The base image with WCSim_hybridPMT is built by https://github.com/kmtsui/wcsim_hybrid_docker/, and the optical_fit package is downloaded from https://github.com/kmtsui/optical_fit_docker and stored in the directory `/optical_fit`.

The entry point is stored in `/optical_fit/optical_fit.entrypoint.sh`, and a sample output file from WCSIM_TreeConvert is stored in `/data/out.root`.

The final image is pushed to `kmtsui/opticalfit:latest` at docker hub.

## Usage
To run the container, simply call
```
docker run -it --rm --name optical_fit_container kmtsui/opticalfit:latest bash
```
Options:
- `-it`: Keep bash open after invoking
- `--rm`: Delete container when stopping. Remove this option if you want to keep your container for more than one session
- `--name optical_fit_container`: Name for your container.
