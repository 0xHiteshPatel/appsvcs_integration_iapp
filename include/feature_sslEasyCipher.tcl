	array set feature_sslEasyCipher_strings {
		compatible {NATIVE:!SSLv3:!SSLv2:!EXPORT:!MD5:!ADH:@STRENGTH}
		medium {TLSv1_2+HIGH:TLSv1_1+HIGH:TLSv1+MEDIUM:TLSv1+HIGH:!EXPORT:!RC4:!EXPORT:!MD5:!ADH:@STRENGTH}
		high {TLSv1_2+HIGH:TLSv1_1+HIGH:TLSv1+MEDIUM:TLSv1+HIGH:!RC4:!RSA:!DHE:!EXPORT:!MD5:!ADH:@STRENGTH}
		tls_1.2 {TLSv1_2:!TLSv1_2+LOW:!EXPORT:!MD5:!ADH:@STRENGTH}
		tls_1.1+1.2 {TLSv1_2:TLSv1_1:!TLSv1_2+LOW:!TLSv1_1+LOW:!EXPORT:!MD5:!ADH:@STRENGTH}
	}

	if { $feature__sslEasyCipher ne "disabled" && [info exists feature_sslEasyCipher_strings($feature__sslEasyCipher)]} {
		debug [list client_ssl create ssl_easy_cipher] [format "sslEasyCipher is not disabled, setting vs__ProfileClientSSLCipherString=%s" $feature_sslEasyCipher_strings($feature__sslEasyCipher)] 5
		set vs__ProfileClientSSLCipherString $feature_sslEasyCipher_strings($feature__sslEasyCipher)
	}
