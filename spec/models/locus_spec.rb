require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe C2::Informant::Locus do
  before(:all) do
    @locus = Fabricate(:locus)
  end
  
  let(:locus) { @locus.reload }
  
  it 'should find an appropriate entry_label' do
    User.should_receive(:instance_methods).and_return(['c2_label'])
    locus.entry_label.should == 'c2_label'
  end
  
  it 'should return locus label if set' do
    locus.entry_label = 'to_s'
    locus.entry_label.should == 'to_s'
  end
end
