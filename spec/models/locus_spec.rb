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
    
    it 'should return nil when json if no entry_label is found' do      
      label = locus.entry_as_json(user)[locus.entry_label]
      label.should be_nil
    end
  end
  
  describe '#entries_page' do
    before(:all) do
      20.times {|| Fabricate(:user) }
    end
    
    it 'should return all entries' do
      locus.entries_page.size.should == 21
      Fabricate(:user)
      locus.entries_page.size.should == 22
      locus.entries.last.destroy
      locus.entries_page.size.should == 21
    end
  end

end
