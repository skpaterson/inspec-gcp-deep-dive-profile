# frozen_string_literal: true

title 'Loop over all GCP Firewalls'

gcp_project = attribute('project_name', description: 'GCP Project Name')

control 'gcp-firewalls-all-3' do
  impact 1.0
  title 'Ensure no SSH or HTTP allowed in firewall rules'
  google_compute_firewalls(project: gcp_project).firewall_names.each do |firewall_name|
    describe google_compute_firewall(project: gcp_project, name: firewall_name) do
      it { should exist }
      its('allowed_ssh?') { should be false }
      its('allowed_http?') { should be false }
    end
  end
end
