# frozen_string_literal: true

title 'Loop over all GCP zones to find all compute instances with a particular label'

gcp_project = attribute('project_name', description: 'GCP Project Name')

control 'gcp-all-compute-labels-4' do
  impact 1.0
  title 'Ensure there are no compute instances with operations_override_do_not_kill label in use'
  google_compute_zones(project: gcp_project).zone_names.each do |zone_name|
    google_compute_instances(project: gcp_project, zone: zone_name).instance_names.each do |instance_name|
      describe google_compute_instance(project: gcp_project, zone: zone_name, name: instance_name) do
        its('labels_keys') { should_not include 'operations_override_do_not_kill' }
      end
    end
  end
end
