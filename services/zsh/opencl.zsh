# OpenCL Vendor
# echo "OpenCL Vendor Setup - opencl.zsh"

# OpenCL setup
# if lspci | grep -i nvidia > /dev/null 2>&1 && [ -f "/etc/OpenCL/vendors/nvidia.icd" ]; then
if [ -f "/etc/OpenCL/vendors/nvidia.icd" ]; then
    export OCL_ICD_VENDORS="/etc/OpenCL/vendors/nvidia.icd"
    # echo "OpenCL Vendor is set to mesa nvidia.icd : OCL_ICD_VENDORS=$OCL_ICD_VENDORS"
elif [ -f "/etc/OpenCL/vendors/amdocl64.icd" ]; then
    export OCL_ICD_VENDORS="/etc/OpenCL/vendors/amdocl64.icd"
    # echo "OpenCL Vendor is set to mesa amdocl64.icd : OCL_ICD_VENDORS=$OCL_ICD_VENDORS"
    #  export OCL_ICD_VENDORS="/etc/OpenCL/vendors/amdocl64_60302_66.icd"
elif [ -f "/etc/OpenCL/vendors/mesa.icd" ]; then
    export OCL_ICD_VENDORS="/etc/OpenCL/vendors/mesa.icd"
    # echo "OpenCL Vendor is set to mesa mesa.icd : OCL_ICD_VENDORS=$OCL_ICD_VENDORS"
else
    # echo "OpenCL Vendor is not set because none were"
    unset OCL_ICD_VENDORS
fi
