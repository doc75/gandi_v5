# frozen_string_literal: true

describe GandiV5::LiveDNS do
  describe '.require_valid_record_type' do
    it 'Does nothing for valid type' do
      expect { described_class.require_valid_record_type 'A' }.to_not raise_error
    end

    it 'Errors on invalid type' do
      expect { described_class.require_valid_record_type 'invalid' }.to raise_error(
        ArgumentError,
        'type must be one of A, AAAA, CNAME, MX, NS, TXT, ALIAS, WKS, ' \
        'SRV, LOC, SPF, CAA, DS, SSHFP, PTR, KEY, DNAME, TLSA, OPENPGPKEY, CDS'
      )
    end
  end
end
