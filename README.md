# Steady-State workflow for subsetting a HUC from the CONUS2 domain

This workflow contains Juypyter notebooks for using [SubsetTools](https://hydroframesubsettools.readthedocs.io/en/latest/) to subset a HUC from the [CONUS2](https://hydroframe.org/parflow-conus2) domain, modify a [ParFlow](https://parflow.org) runscript, then configure a special [EcoSLIM](https://github.com/reedmaxwell/EcoSLIM) run to trace out streamlines within that domain.

1. Start with the workbook subset_static_CONS2_inputs.dist.0205.ipynb, this workbook will clip all the files you need from CONUS2 for your HUC
2. then use the workbook get_pf_inputs.0205.dist.ipynb, this workbook sets up your parflow input keys and saves as a yaml file
3. then use the workbook run_pf_velocity.0205.dist.ipynb, this workbook loads the yaml file from (2) futher modifies to run one timestep and output velocities and runs parflow
4. then use make_sat_vtk.0205.dist.tcl to create 3D VTKs of your streams, DEM, mask and some model outputs
