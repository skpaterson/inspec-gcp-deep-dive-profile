# frozen_string_literal: true

title 'Single zone test'

gcp_project = attribute('project_name', description: 'GCP Project Name')
gcp_zone = attribute('zone_name', description: 'A valid GCP zone name to test')

control 'gcp-single-zone-1' do
  impact 1.0
  title 'Check the status of a single zone'
  describe google_compute_zone(project: gcp_project, name: gcp_zone) do
    it { should exist }
    its('status') { should eq 'UP' }
  end
end
