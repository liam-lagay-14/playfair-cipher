require_relative '../lib/encryption_cipher'
require_relative '../lib/digraph'

describe EncryptionCipher do

  let(:encryption_cipher) { EncryptionCipher.new('meet me at hammersmith bridge tonight', 'CHARLES') }

  let(:cipher_with_invalid_keyword) { EncryptionCipher.new('Test Message', '')}

  let(:cipher_with_letter_j_present) { EncryptionCipher.new('Meet me in Hammersmith', 'JAMJAR')}

  it 'should return a message and digraph' do
    expect(encryption_cipher.message).to eq('meet me at hammersmith bridge tonight')

    expect(encryption_cipher.digraph.keyword.keyword).to eq('CHARLES')
  end

  it 'should take digraph array and message pairs' do
    encrypted_message = encryption_cipher.encrypt_message

    expect(encrypted_message).to eq('GDVBYTBCPRRKYKDCDIMPASHMEMDOUGKIRP')
  end

 it 'should return the original message pairs when decrypting the message' do
    encryption_message = encryption_cipher.encrypt_message

    decrypted_message = encryption_cipher.decrypt_message(encryption_message)

    expect(decrypted_message).to eq('MEXETMEATHAMXMERSMITHBRIDGETONIGHT')
  end

  it 'should return the correct encryption when a key containing letter J is used' do
    encryption_message = cipher_with_letter_j_present.encrypt_message

    expect(encryption_message).to eq('ELMLSRCMOKMRMEFMXERPLV')
  end

  context 'error should be thrown if an invalid keyword is entered' do
    subject { cipher_with_invalid_keyword }

    it { expect { subject}.to raise_error(ArgumentError) }
  end
end