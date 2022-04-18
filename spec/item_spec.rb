require_relative '../classes/item'

describe Item do
    before(:each) do
        @item = Item.new('2011/10/01', false)
    end

    context '#initialize' do
        it 'should be an instance of Item' do
            expect(@item).to be_an_instance_of Item
        end

        it 'item published date should be of type Date' do
            expect(@item.publish_date).to be_an_instance_of Date
        end

        it 'should have a date' do
            expect(@item.publish_date.to_s).to eq('2011-10-01')
        end

        it 'should have a archived' do
            expect(@item.archived).to eq(false)
        end
    end

    context 'test methods in the items class to' do
        it 'can_be_archived? method should' do
            expect(@item.can_be_archived?).to eq(true)
        end 

        it 'can_be_archived? method should return false' do
            item_instance = Item.new('2020/10/01', true)
            expect(item_instance.can_be_archived?).to eq(false)
        end
    end
end