# frozen_string_literal: true

title 'Loop over all GCP Zones'

gcp_project = attribute('project_name', description: 'GCP Project Name')

control 'gcp-zones-all-2' do
  impact 1.0
  title 'All zones should be UP'
  google_compute_zones(project: gcp_project).zone_names.each do |zone_name|
    describe google_compute_zone(project: gcp_project, name: zone_name) do
      it { should exist }
      its('kind') { should eq 'compute#zone' }
      its('status') { should eq 'UP' }
    end
  end
end
