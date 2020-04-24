package test

import (
	"fmt"
	"math/rand"
	"strings"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTaskDefEc2(t *testing.T) {
	t.Parallel()

	rand.Seed(time.Now().UnixNano())

	//Expected Value
	expectedName := fmt.Sprintf("nginx-%s", strings.ToLower(random.UniqueId()))

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/ec2",
		Upgrade:      true,

		// Variables to pass to ourt Terrraform code using -var options
		Vars: map[string]interface{}{
			"name": expectedName,
		},

		// Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": "us-east-2",
		},
	}
	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	thisName := terraform.Output(t, terraformOptions, "this_name")
	assert.Equal(t, expectedName, thisName)

}
