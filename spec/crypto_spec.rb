# frozen_string_literal: true

require_relative '../credit_card'
require_relative '../substitution_cipher'
require_relative '../double_trans_cipher'
require_relative '../sk_cipher'
require 'minitest/autorun'

describe 'Test card info encryption' do
  before do
    @cc = CreditCard.new('4916603231464963', 'Mar-30-2020',
                         'Soumya Ray', 'Visa')
    @key = 3
    @sk_key = ModernSymmetricCipher.generate_new_key

    @enc = {
      'caesar' => SubstitutionCipher::Caesar.encrypt(@cc, @key),
      'permutation' => SubstitutionCipher::Permutation.encrypt(@cc, @key),
      'double transposition' => DoubleTranspositionCipher.encrypt(@cc, @key),
      'modern symmetric' => ModernSymmetricCipher.encrypt(@cc, @sk_key)
    }

    @dec = {
      'caesar' => SubstitutionCipher::Caesar.decrypt(@enc['caesar'], @key),
      'permutation' => SubstitutionCipher::Permutation.decrypt(@enc['permutation'], @key),
      'double transposition' => DoubleTranspositionCipher.decrypt(@enc['double transposition'], @key),
      'modern symmetric' => ModernSymmetricCipher.decrypt(@enc['modern symmetric'], @sk_key)
    }
  end

  ['caesar', 'permutation', 'double transposition', 'modern symmetric'].each do |method|
    describe "Using #{method} cipher" do
      it 'should encrypt card information' do
        enc = @enc[method]
        _(enc).wont_equal @cc.to_s
        _(enc).wont_be_nil
      end

      it 'should decrypt text' do
        dec = @dec[method]
        _(dec).must_equal @cc.to_s
      end
    end
  end
end
