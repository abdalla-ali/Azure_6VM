# Terraform Azure VM Deployment

This project provides a modular Terraform configuration for deploying six Windows virtual machines (VMs) in Azure. The VMs are configured to run on the D4ds v4 machine type and are connected to a specified virtual network and subnet without public IP addresses.

## Project Structure

The project is organized as follows:

```
terraform-azure-vm
├── modules
│   └── vm
│       ├── main.tf          # Main configuration for VM deployment
│       ├── outputs.tf       # Outputs for the VM module
│       ├── variables.tf     # Input variables for the VM module
│       └── versions.tf      # Required provider and Terraform versions
├── env
│   └── production
│       ├── main.tf          # Entry point for the production environment
│       ├── outputs.tf       # Outputs for the production environment
│       ├── variables.tf     # Input variables for the production environment
│       └── backend.tf       # Backend configuration for state storage
├── variables
│   └── production.tfvars     # Variable values for the production environment
├── .gitignore                # Files and directories to ignore in Git
└── README.md                 # Project documentation
```

## Setup Instructions

1. **Prerequisites**: Ensure you have Terraform installed and configured with access to your Azure account.

2. **Clone the Repository**:
   ```
   git clone <repository-url>
   cd terraform-azure-vm
   ```

3. **Configure Variables**: Update the `variables/production.tfvars` file with your specific configurations, including the resource group name, virtual network name, and subnet name.

4. **Initialize Terraform**:
   ```
   terraform init
   ```

5. **Plan the Deployment**:
   ```
   terraform plan -var-file=variables/production.tfvars
   ```

6. **Apply the Configuration**:
   ```
   terraform apply -var-file=variables/production.tfvars
   ```

## Usage

This Terraform configuration will create six VMs named `QCH-MGMT-JB-T1-1` to `QCH-MGMT-JB-T1-6` in the specified resource group and connect them to the designated virtual network and subnet.

## Outputs

After deployment, you can retrieve information about the created VMs from the outputs defined in the `modules/vm/outputs.tf` and `env/production/outputs.tf` files.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.