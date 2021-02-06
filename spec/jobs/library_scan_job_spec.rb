require "rails_helper"

RSpec.describe LibraryScanJob, type: :job do
  let(:library) do
    create(:library, path: File.join(Rails.root, "spec", "fixtures", "library"))
  end

  it "can scan a library directory" do
    expect { LibraryScanJob.perform_now(library) }.to change { library.models.count }.to(1)
    expect(library.models.first.name).to eq "Model One"
  end
end
