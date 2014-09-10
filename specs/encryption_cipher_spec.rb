require_relative '../lib/encryption_cipher'
require_relative '../lib/message'
require_relative '../lib/digraph'

describe EncryptionCipher do

  let(:encryption_cipher) { EncryptionCipher.new('meet me at hammersmith bridge tonight', 'CHARLES') }

  let(:second_encryption_cipher) { EncryptionCipher.new('Test Message', 'LIAMTEST') }

  let(:cipher_with_invalid_keyword) { EncryptionCipher.new('Test Message', '')}

  it 'should return a message and digraph' do
    expect(encryption_cipher.message_to_encrypt.message).to eq('meet me at hammersmith bridge tonight')

    expect(encryption_cipher.digraph.keyword.keyword).to eq('CHARLES')
  end

  it 'should take digraph array and message pairs' do
    expect(encryption_cipher.encrypted_pairs).to eq([%w(G D), %w(V B), %w(Y T), %w(B C), %w(P R),
                                                     %w(R K), %w(Y K), %w(D C), %w(D I), %w(M P),
                                                     %w(A S), %w(H M), %w(E M), %w(D O), %w(U G),
                                                     %w(K I), %w(R P)])
  end

  context 'test a second test message and keyword' do
    subject { second_encryption_cipher }

    it { expect(subject.encrypted_pairs).to eq([%w(L D), %w(D I), %w(L C), %w(B W), %w(B I), %w(F S)])}
  end

  context 'error should be thrown if an invalid keyword is entered' do
    subject { cipher_with_invalid_keyword }

    it { expect { subject}.to raise_error(ArgumentError) }
  end
end