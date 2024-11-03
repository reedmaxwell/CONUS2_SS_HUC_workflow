# Steady-State workflow for subsetting a HUC from the CONUS2 domain

This workflow contains Juypyter notebooks for using [SubsetTools](https://hydroframesubsettools.readthedocs.io/en/latest/) to subset a HUC from the [CONUS2](https://hydroframe.org/parflow-conus2) domain, modify a [ParFlow](https://parflow.org) runscript, then configure a special [EcoSLIM](https://github.com/reedmaxwell/EcoSLIM) run to trace out streamlines within that domain.

1. Start with the workbook `subset_static_CONS2_inputs.dist.0205.ipynb`, this workbook will clip all the files you need from CONUS2 for your HUC
2. then use the workbook `get_pf_inputs.0205.dist.ipynb`, this workbook sets up your parflow input keys and saves as a yaml file
3. then use the workbook `run_pf_velocity.0205.dist.ipynb`, this workbook loads the yaml file from (2) futher modifies to run one timestep and output velocities and runs parflow
4. then use `make_sat_vtk.0205.dist.tcl` to create 3D VTKs of your streams, DEM, mask and some model outputs
5. build a custom version of EcoSLIM with the `EcoSLIM.f90` file provided here.  This workflow will not work with the default version of EcoSLIM
6. then use the workbook `run_EcoSLIM.0205.dist.ipynb` to run EcoSLIM and analyze the output.  Some sample analysis cells are provided.
7. the workbook `Read_wells_convert_CONS2_inputs.0205.dist.ipynb` is an example of how to turn the EOG wells database into a EcoSLIM input file for CONUS2, HUC0205
8. the workbook `uog_run_EcoSLIM.0205.dist.ipynb` will then use this mask file (generated in 7) to run EcoSLIM forward from the wells to the nearest stream
