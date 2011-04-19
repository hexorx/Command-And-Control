require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe C2::Informant::Locus do
  before(:all) do
    @locus = Fabricate(:locus, :class_name => 'User')
    @user = Fabricate(:user)
  end
  
  let(:locus) { @locus.reload }
  let(:user) { @user.reload }
  
  describe '#entry_label' do
    it 'should find an appropriate entry_label' do
      User.should_receive(:instance_methods).and_return(['c2_label'])
      locus.entry_label.should == 'c2_label'
    end
  
    it 'should return locus label if set' do
      locus.entry_label = 'this_label'
      locus.entry_label.should == 'this_label'
    end
    
    it 'should be returned in the entry_json' do
      locus.entry_label = 'c2_title'
      label = locus.entry_as_json(user)['c2_title']
      label.should == user.c2_title
    end
  end

end
